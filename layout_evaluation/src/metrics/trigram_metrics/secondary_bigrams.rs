//! The trigram metric `SecondaryBigrams` takes the first and last symbol of a trigram
//! and evaluates it with all configured bigram metrics that can assign costs to
//! individual bigrams (`individual_cost` does not return `None`).

use super::TrigramMetric;
use crate::metrics::bigram_metrics::BigramMetric;

use crate::results::NormalizationType;

use keyboard_layout::layout::{LayerKey, Layout};

use rustc_hash::FxHashSet;
use serde::Deserialize;

#[derive(Clone, Deserialize, Debug)]
pub struct Parameters {
    /// Factor to apply to a trigram's weight before assigning it to the secondary bigram if the trigram involves no handswitch.
    pub factor_no_handswitch: f64,
    /// Factor to apply to a trigram's weight before assigning it to the secondary bigram if the trigram involves a handswitch.
    pub factor_handswitch: f64,
    /// Exclude secondary bigrams for trigrams starting with at least one of the given symbols.
    /// Used in combination with `followup_pause_indicators`.
    pub initial_pause_indicators: FxHashSet<char>,
    /// Exclude secondary bigrams for trigrams that first contain one of the `initial_pause_indicators`, then one of the
    /// `followup_pause_indicators` and finally contain a normal non-`..._pause_indicators`-symbol
    pub followup_pause_indicators: FxHashSet<char>,
}

#[derive(Clone, Debug)]
pub struct SecondaryBigrams {
    bigram_metrics: Vec<(f64, NormalizationType, Box<dyn BigramMetric>)>,
    factor_no_handswitch: f64,
    factor_handswitch: f64,
    initial_pause_indicators: FxHashSet<char>,
    followup_pause_indicators: FxHashSet<char>,
}

impl SecondaryBigrams {
    pub fn new(
        bigram_metrics: Vec<(f64, NormalizationType, Box<dyn BigramMetric>)>,
        params: &Parameters,
    ) -> Self {
        Self {
            bigram_metrics,
            factor_no_handswitch: params.factor_no_handswitch,
            factor_handswitch: params.factor_handswitch,
            initial_pause_indicators: params.initial_pause_indicators.clone(),
            followup_pause_indicators: params.followup_pause_indicators.clone(),
        }
    }
}

impl TrigramMetric for SecondaryBigrams {
    fn name(&self) -> &str {
        "Secondary Bigrams"
    }

    #[inline(always)]
    fn individual_cost(
        &self,
        k1: &LayerKey,
        k2: &LayerKey,
        k3: &LayerKey,
        weight: f64,
        total_weight: f64,
        layout: &Layout,
    ) -> Option<f64> {
        if k1 == k3 && k1.is_modifier {
            return Some(0.0);
        }

        if self.initial_pause_indicators.contains(&k1.symbol)
            && (self.followup_pause_indicators.is_empty()
                || (self.followup_pause_indicators.contains(&k2.symbol)
                    && !self.initial_pause_indicators.contains(&k3.symbol)
                    && !self.followup_pause_indicators.contains(&k3.symbol)))
        {
            // Return Some(0.0) if:
            // 1. The first key is an `initial_pause_indicators`
            // 2. The second key is a `followup_pause_indicators`
            // 3. The third key is a normal letter (= not a pause_indicator of any kind)
            /* println!(
                "{}{}{}  {}",
                k1.symbol,
                k2.symbol,
                k3.symbol,
                k2.symbol.escape_unicode()
            ); */
            return Some(0.0);
        }

        let factor = if k1.key.hand == k2.key.hand && k2.key.hand == k3.key.hand {
            self.factor_no_handswitch
        } else {
            self.factor_handswitch
        };

        let cost: f64 = self
            .bigram_metrics
            .iter()
            .map(|(metric_weight, _, metric)| {
                factor
                    * metric_weight
                    * metric
                        .individual_cost(k1, k3, weight, total_weight, layout)
                        .unwrap_or(0.0)
            })
            .sum();

        Some(cost)
    }
}
