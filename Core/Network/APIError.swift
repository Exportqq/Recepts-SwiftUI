import Foundation

enum APIError: Error {
    case invalidURL
    case server(Int)
    case decoding
    case unknown
    case unauthorized
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Некорректный URL запроса"
        case .server(let code): return "Ошибка сервера: \(code)"
        case .decoding: return "Ошибка декодирования ответа"
        case .unauthorized: return "Не авторизован"
        case .unknown: return "Неизвестная ошибка"
        }
    }
}
