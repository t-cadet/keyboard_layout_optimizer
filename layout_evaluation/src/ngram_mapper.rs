//! The `ngram_mapper` module provides a trait and an implementation for providing
//! mapped ngrams in terms of (references to) LayerKeys.
//!
//! Input ngrams consist of chars (or strings) and need to be mapped to a keyboards keys before
//! one can meaningfully analyse them. In the context of a layout evaluation, this mapping is performed
//! once up front instead of by each metric individually.
//!
//! The provided implementation [`OnDemandNgramMapper`] of the trait additionally performs some postprocessing
//! of the ngram data. This involves increasing the weight of bigrams that appear often, adding secondary
//! bigrams from the first and third symbol of each trigram (if they belong to the same hand), and resolving
//! modifiers of higher-layer symbols:
//!
//! Input ngrams may contain symbols that may only be accessible in higher layers
//! of a layout, e.g. uppercase characters. Generating such higher-layer symbols requires the use
//! of modifiers that are keys of the keyboard as well. It is assumed, that each modifier has a
//! left and a right hand variant and the one on the opposite side of the key to modify is used.
//!
//! A major part of the ngram mapping process involves transforming ("expanding") ngrams involving higher-layer
//! symbols into multiple ngrams containing only base-layer symbols (including the modifier keys).
//! This process usually is the computationally most expensive step in the evaluation process and
//! needs to be performed for each layout individually.
//!
//! Each unigram of a higher-layer symbol will transform into a unigram with the base-layer key and one
//! for each modifier involved in accessing the higher layer.
//!
//! Each bigram of higher-layer symbols will transform into a series of bigrams with permutations of
//! the involved base-keys and modifers. However, the base-key will always be after its modifier.
//!
//! Each trigram of higher-layer symbols will transform into a series of various trigrams with permutations
//! of the involved base-keys and modifiers. Keys from the latter parts of the trigram will always be after
//! former ones and modifers always come before their base key. The number of generated trigrams from a single
//! trigram can be large (tens of trigrams) if multiple symbols of the trigram are accessed using multiple modifiers.

pub mod bigram_mapper;
pub mod common;
pub mod trigram_mapper;
pub mod unigram_mapper;

pub mod on_demand_ngram_mapper;

use keyboard_layout::layout::{LayerKey, Layout};

use std::fmt;

/// Unigrams in terms of a [`Layout`]'s [`LayerKey`]s and statistics about ngrams that
/// can not be generated by the layout.
pub struct MappedUnigrams<'s> {
    /// Unigrams in terms of [`LayerKey`]s
    pub grams: Vec<(&'s LayerKey, f64)>,
    /// Total weight (frequencies) of unigrams that can not be generated by the layout
    pub weight_not_found: f64,
    /// Total weight (frequencies) of unigrams that can be generated by the layout
    pub weight_found: f64,
}

/// Bigrams in terms of a [`Layout`]'s [`LayerKey`]s and statistics about ngrams that
/// can not be generated by the layout.
pub struct MappedBigrams<'s> {
    /// Unigrams in terms of [`LayerKey`]s
    pub grams: Vec<((&'s LayerKey, &'s LayerKey), f64)>,
    /// Total weight (frequencies) of unigrams that can not be generated by the layout
    pub weight_not_found: f64,
    /// Total weight (frequencies) of unigrams that can be generated by the layout
    pub weight_found: f64,
}

/// Trigrams in terms of a [`Layout`]'s [`LayerKey`]s and statistics about ngrams that
/// can not be generated by the layout.
pub struct MappedTrigrams<'s> {
    /// Unigrams in terms of [`LayerKey`]s
    pub grams: Vec<((&'s LayerKey, &'s LayerKey, &'s LayerKey), f64)>,
    /// Total weight (frequencies) of unigrams that can not be generated by the layout
    pub weight_not_found: f64,
    /// Total weight (frequencies) of unigrams that can be generated by the layout
    pub weight_found: f64,
}

/// Provides ngrams in terms of a [`Layout`]'s [`LayerKey`]s.
pub trait NgramMapper: Send + Sync + NgramMapperClone + fmt::Debug {
    fn map_unigrams<'s>(&self, layout: &'s Layout) -> MappedUnigrams<'s>;
    fn map_bigrams<'s>(&self, layout: &'s Layout) -> MappedBigrams<'s>;
    fn map_trigrams<'s>(&self, layout: &'s Layout) -> MappedTrigrams<'s>;
}

// in order to implement clone for Box<dyn LayoutMetric>, the following trick is necessary
// see https://stackoverflow.com/questions/30353462/how-to-clone-a-struct-storing-a-boxed-trait-object
// alternative: use `dyn_clone` crate

impl Clone for Box<dyn NgramMapper> {
    fn clone(&self) -> Box<dyn NgramMapper> {
        self.clone_box()
    }
}

pub trait NgramMapperClone {
    fn clone_box(&self) -> Box<dyn NgramMapper>;
}

impl<T> NgramMapperClone for T
where
    T: 'static + NgramMapper + Clone,
{
    fn clone_box(&self) -> Box<dyn NgramMapper> {
        Box::new(self.clone())
    }
}
