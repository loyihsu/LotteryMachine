///
/// # Crawler
///
/// Abstraction/Facade of SwiftSoup
///
/// Created by Loyi Hsu on 2021/8/14.
///

import SwiftSoup
import Foundation

public class Crawler {
    public static func getDocument(html: String) -> Document? {
        if let doc = try? SwiftSoup.parse(html) {
            return doc
        }
        return nil
    }

    public static func getResponse(from url: URL) -> Document? {
        if let content = try? String(contentsOf: url),
           let parsed = getDocument(html: content) {
            return parsed
        }
        return nil
    }

    public static func extract(from document: Document, selector: String) -> Elements? {
        if let extracted = try? document.select(selector) {
            return extracted
        }
        return nil
    }

    public static func extract(html: String, selector: String) -> Elements? {
        if let doc = getDocument(html: html),
           let extracted = extract(from: doc, selector: selector) {
            return extracted
        }
        return nil
    }

    public static func text(html: String) -> String? {
        if let doc = getDocument(html: html),
           let text = try? doc.text() {
            return text
        }
        return nil
    }
}
