# Unhandled Task Cancellation in Async/Await Swift Code

This repository demonstrates a common error in Swift's async/await: failing to handle task cancellation. The original `fetchData` function doesn't gracefully handle cancellation, potentially leading to crashes or resource leaks. The solution provides a corrected version using `Task.isCancelled` for proper cancellation handling.