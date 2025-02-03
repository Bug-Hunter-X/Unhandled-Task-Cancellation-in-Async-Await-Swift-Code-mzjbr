func fetchData() async throws -> Data {
    let url = URL(string: "https://api.example.com/data")!
    let (data, response) = try await URLSession.shared.data(from: url)

    guard Task.isCancelled == false else { //Check if the task is cancelled
        throw CancellationError()
    }
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }

    return data
}

Task { //Task is used to call the async function
    do {
        let data = try await fetchData()
        // Process the data
    } catch {
        if let error = error as? CancellationError {
            print("Task cancelled")
        }else {
            print("Error fetching data: \(error)")
        }
    }
}