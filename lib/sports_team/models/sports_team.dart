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
          avatarUrl:
              'https://cdn.nba.com/headshots/nba/latest/1040x760/2544.png',
          description:
              'The Los Angeles Lakers are one of the most successful franchises in NBA history, boasting 17 championship titles. LeBron James, widely regarded as one of the greatest basketball players of all time, continues to dominate the court with his versatile playmaking, scoring prowess, and unmatched leadership.',
        ),
        SportsTeam(
          teamName: 'Real Madrid CF',
          playerName: 'Jude Bellingham',
          avatarUrl: 'https://images.onefootball.com/players/180/343087.jpg',
          description:
              'Real Madrid CF is a European football giant with a record-extending 15 UEFA Champions League titles. English prodigy Jude Bellingham has taken the club by storm, combining elite athleticism, incredible technical skill, and a mature goalscoring presence from midfield.',
        ),
        SportsTeam(
          teamName: 'Kansas City Chiefs',
          playerName: 'Patrick Mahomes',
          avatarUrl:
              'https://static.www.nfl.com/image/upload/t_headshot_desktop/league/iireqbn32cpg9fn4sfy7',
          description:
              'The Kansas City Chiefs are the modern dynasty of the NFL. Led by multi-time Super Bowl champion and MVP quarterback Patrick Mahomes, their explosive offense and Mahomes\' signature creative arm-angles make them a force to be reckoned with.',
        ),
        SportsTeam(
          teamName: 'Scuderia Ferrari F1',
          playerName: 'Charles Leclerc',
          avatarUrl:
              'https://img2.51gt3.com/rac/racer/202503/fe2de9975d864e38acfd9933164954a6.png?x-oss-process=style/_nowm',
          description:
              'Scuderia Ferrari is the pinnacle of motorsport heritage, holding the most constructors\' championships in Formula 1 history. Charles Leclerc, known as the "Predestined", is celebrated for his qualifying wizardry, raw pace, and passionate driving style.',
        ),
      ];
}
