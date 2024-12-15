//! The `metrics` module provides a trait for layout metrics.
use keyboard_layout::layout::Layout;

use std::fmt;

pub mod kla_home_key_words;
pub mod kla_same_finger_words;
pub mod shortcut_keys;
pub mod similar_letter_groups;
pub mod similar_letters;

/// LayoutMetric is a trait for metrics that depends only on the layout.
pub trait LayoutMetric: Send + Sync + LayoutMetricClone + fmt::Debug {
    /// Return the name of the metric
    fn name(&self) -> &str;
    /// Compute the total cost for the metric
    fn total_cost(&self, layout: &Layout) -> (f32, Option<String>);
}

// in order to implement clone for Box<dyn LayoutMetric>, the following trick is necessary
// see https://stackoverflow.com/questions/30353462/how-to-clone-a-struct-storing-a-boxed-trait-object
// alternative: use `dyn_clone` crate

impl Clone for Box<dyn LayoutMetric> {
    fn clone(&self) -> Box<dyn LayoutMetric> {
        self.clone_box()
    }
}

/// Helper trait for realizing clonability for `Box<dyn LayoutMetric>`.
pub trait LayoutMetricClone {
    fn clone_box(&self) -> Box<dyn LayoutMetric>;
}

impl<T> LayoutMetricClone for T
where
    T: 'static + LayoutMetric + Clone,
{
    fn clone_box(&self) -> Box<dyn LayoutMetric> {
        Box::new(self.clone())
    }
}
