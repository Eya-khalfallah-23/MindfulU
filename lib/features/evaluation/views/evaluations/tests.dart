import 'package:flutter/material.dart';

import 'test_page.dart';

class TestAPage extends StatelessWidget {
  final String userMood;

  const TestAPage({Key? key, required this.userMood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TestPage(
      testName: 'GAD-7',
      pageTitle: 'GAD-7',
      questions: const [
        {
          'Feeling nervous, anxious or on edge?': [
            'Not at all',
            'Several days',
            'More than half of the days',
            'Nearly every day'
          ]
        },
        {
          'Not being able to stop or control worrying?': [
            'Not at all',
            'Several days',
            'More than half of the days',
            'Nearly every day'
          ]
        },
        {
          'Worrying too much about different things': [
            'Not at all',
            'Several days',
            'More than half of the days',
            'Nearly every day'
          ]
        },
        {
          'Trouble relaxing': [
            'Not at all',
            'Several days',
            'More than half of the days',
            'Nearly every day'
          ]
        },
        {
          'Being so restless that it is hard to sit still': [
            'Not at all',
            'Several days',
            'More than half of the days',
            'Nearly every day'
          ]
        },
        {
          'Becoming easily annoyed or irritable': [
            'Not at all',
            'Several days',
            'More than half of the days',
            'Nearly every day'
          ]
        },
        {
          'Feeling afraid, as if something awful might happen': [
            'Not at all',
            'Several days',
            'More than half of the days',
            'Nearly every day'
          ]
        },
      ],
      responseScores: const [
        [
          {
            'Not at all': 0,
            'Several days': 1,
            'More than half of the days': 2,
            'Nearly every day': 3,
          }
        ],
        [
          {
            'Not at all': 0,
            'Several days': 1,
            'More than half of the days': 2,
            'Nearly every day': 3,
          }
        ],
        [
          {
            'Not at all': 0,
            'Several days': 1,
            'More than half of the days': 2,
            'Nearly every day': 3,
          }
        ],
        [
          {
            'Not at all': 0,
            'Several days': 1,
            'More than half of the days': 2,
            'Nearly every day': 3,
          }
        ],
        [
          {
            'Not at all': 0,
            'Several days': 1,
            'More than half of the days': 2,
            'Nearly every day': 3,
          }
        ],
        [
          {
            'Not at all': 0,
            'Several days': 1,
            'More than half of the days': 2,
            'Nearly every day': 3,
          }
        ],
        [
          {
            'Not at all': 0,
            'Several days': 1,
            'More than half of the days': 2,
            'Nearly every day': 3,
          }
        ],
      ],
      userMood: userMood,
    );
  }
}

class TestBPage extends StatelessWidget {
  final String userMood;

  const TestBPage({Key? key, required this.userMood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TestPage(
      testName: 'PHQ-9',
      pageTitle: 'PHQ-9',
  questions: const [
    {
      'Little interest or pleasure in doing things?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Feeling down, depressed, or hopeless?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Trouble falling or staying asleep, or sleeping too much?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Feeling tired or having little energy?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Poor appetite or overeating?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Feeling bad about yourself - or that you are a failure or have let yourself or your family down?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Trouble concentrating on things, such as reading the newspaper or watching television?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Moving or speaking so slowly that other people could have noticed? Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
    {
      'Thoughts that you would be better off dead, or of hurting yourself in some way?': [
        'Not at all',
        'Several days',
        'More than half of the days',
        'Nearly every day'
      ]
    },
  ],
  responseScores: const [
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
    [
      {'Not at all': 0, 'Several days': 1, 'More than half of the days': 2, 'Nearly every day': 3}
    ],
  ],
      userMood: userMood,
    );
  }
}

class TestCPage extends StatelessWidget {
  final String userMood;

  const TestCPage({Key? key, required this.userMood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TestPage(
      testName: 'PSS',
      pageTitle: 'Perceived Stress Scale (PSS)',
      questions: const [
        {
          'Feeling nervous or stressed?': [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Unable to control the important things in your life?': [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling confident about your ability to handle your personal problems?':
              [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling that things were going your way?': [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling difficulties were piling up so high that you could not overcome them?':
              [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling confident about your ability to handle personal problems?': [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling that things were going your way?': [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling difficulties were piling up so high that you could not overcome them?':
              [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Able to control the important things in your life?': [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling that things were going your way?': [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
        {
          'Feeling difficulties were piling up so high that you could not overcome them?':
              [
            'Never',
            'Almost never',
            'Sometimes',
            'Fairly often',
            'Very often'
          ]
        },
      ],
      responseScores: const [
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
        [
          {
            'Never': 0,
            'Almost never': 1,
            'Sometimes': 2,
            'Fairly often': 3,
            'Very often': 4
          }
        ],
      ],
      userMood: userMood,
    );
  }
}
