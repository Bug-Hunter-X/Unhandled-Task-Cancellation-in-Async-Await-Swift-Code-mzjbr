func fetchData() async throws -> Data {
    let url = URL(string: "https://api.example.com/data")!
    let (data, response) = try await URLSession.shared.data(from: url)

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
        print("Error fetching data: \(error)")
    }
}