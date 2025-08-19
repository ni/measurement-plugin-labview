This test measurement exists to validate changes made to the measurement template where the plugin VIs are now called directly
using sub VI method calls using dynamic dispatch VIs rather than call by reference. Its plugin implementation should remain unchanged
in order to verify compatibility with the measurement template is not broken over time.