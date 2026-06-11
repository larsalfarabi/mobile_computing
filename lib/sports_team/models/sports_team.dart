class SportsTeam {
  final String teamName;
  final String playerName;
  final String avatarUrl;
  final String description;

  SportsTeam({
    required this.teamName,
    required this.playerName,
    required this.avatarUrl,
    required this.description,
  });

  /// Mock data providing 4 real-world sports teams and their main players.
  static List<SportsTeam> get mockTeams => [
        SportsTeam(
          teamName: 'Los Angeles Lakers',
          playerName: 'LeBron James',
          avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500&auto=format&fit=crop&q=80',
          description:
              'The Los Angeles Lakers are one of the most successful franchises in NBA history, boasting 17 championship titles. LeBron James, widely regarded as one of the greatest basketball players of all time, continues to dominate the court with his versatile playmaking, scoring prowess, and unmatched leadership.',
        ),
        SportsTeam(
          teamName: 'Real Madrid CF',
          playerName: 'Jude Bellingham',
          avatarUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&auto=format&fit=crop&q=80',
          description:
              'Real Madrid CF is a European football giant with a record-extending 15 UEFA Champions League titles. English prodigy Jude Bellingham has taken the club by storm, combining elite athleticism, incredible technical skill, and a mature goalscoring presence from midfield.',
        ),
        SportsTeam(
          teamName: 'Kansas City Chiefs',
          playerName: 'Patrick Mahomes',
          avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=500&auto=format&fit=crop&q=80',
          description:
              'The Kansas City Chiefs are the modern dynasty of the NFL. Led by multi-time Super Bowl champion and MVP quarterback Patrick Mahomes, their explosive offense and Mahomes\' signature creative arm-angles make them a force to be reckoned with.',
        ),
        SportsTeam(
          teamName: 'Scuderia Ferrari F1',
          playerName: 'Charles Leclerc',
          avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=500&auto=format&fit=crop&q=80',
          description:
              'Scuderia Ferrari is the pinnacle of motorsport heritage, holding the most constructors\' championships in Formula 1 history. Charles Leclerc, known as the "Predestined", is celebrated for his qualifying wizardry, raw pace, and passionate driving style.',
        ),
      ];
}
