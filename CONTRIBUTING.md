# Contributing to ID3TagEditor
We love your input! :heart: We want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## We Develop with Github
We use github to host code, to track issues and feature requests, as well as accept pull requests.

## We Use [Github Flow](github flow), So All Code Changes Happen Through Pull Requests
Pull requests are the best way to propose changes to the codebase (we use [Github Flow](github flow)). We actively welcome your pull requests:

1. Fork the repo and create your branch from `master`.
2. If you've added code that should be tested, add tests.
3. If you've changed APIs, update the documentation.
4. Ensure the test suite passes.
5. Make sure your code lints.
6. Issue that pull request!

## Report bugs using Github's [issues](https://github.com/chicio/ID3TagEditor/issues)
We use GitHub issues to track public bugs. Report a bug by [opening a new issue](https://github.com/chicio/ID3TagEditor/issues/new/choose "opening an issue"); it's that easy! :purple_heart:

**Great Bug Reports** tend to have:
- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can.
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

People *love* :cupid: beautiful bug reports.

# Code review process
We will review every pull request in detail and eventually start discussions about the implementation. We will reject pull request that doesn't respect the code style described below.

## Coding Style
This project uses [SwiftLint]() for code linting. A Pull Request will not be merged if it doesn't respect the SwiftLint linting rules (default + [some overrides](https://github.com/chicio/ID3TagEditor/blob/master/.swiftlint.yml)).
In fact one of the checks that a Pull Request must pass is the SwiftLint linting (automatically run by Github Actions).

## Test Coverage
This project uses Codecov as code coverage tool. Every new Pull Request should have a test coverage equal to or greater than master. 
Codecov code coverage is one of the Pull Request checks (automatically run by Github Actions). 

## License
By contributing, you agree that your contributions will be licensed under its [MIT License](https://github.com/chicio/ID3TagEditor/blob/master/LICENSE.md).

## References
This document was adapted from the open-source contribution guidelines for [Facebook's contributing guidelines](https://github.com/facebook/draft-js/blob/a9316a723f9e918afde44dea68b5f9f39b7d9b00/CONTRIBUTING.md).
