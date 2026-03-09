//
//  ProfileStats.swift
//  SwiftExercises
//
//  Created by Fernando Correia on 09.03.26.
//

import SwiftUI

struct ProfileStatsView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProfileStat(title: "Followers", value: "1.2K")
            ProfileStat(title: "Posts", value: "84")
            ProfileStat(title: "Likes", value: "9.1K")
        }
        .padding()
    }
}

struct ProfileStat: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(value)
                    .font(.headline)

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .cardStyle()
    }
}

private struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

private extension View {
    func cardStyle() -> some View {
        modifier(CardModifier())
    }
}

#Preview {
    ProfileStatsView()
}
