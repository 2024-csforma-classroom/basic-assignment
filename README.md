# basic-assignment
Basic Assignment (Template)

## Assignment

<span style="color: red; font-weight: bold;">Include the assignment description here</span>.

## [Visual Studio Code](https://code.visualstudio.com/) [Makefile](https://www.gnu.org/software/make/manual/make.html) [Java](https://docs.oracle.com/en/java/) project structure

Created by [`nathanfriend.io`](https://arc.net/l/quote/lhclbksa).

```text
.
├── .devcontainer/
│   └── devcontainer.json
├── .gitignore
├── .vscode/
│   ├── launch.json
│   └── settings.json
├── LICENSE
├── Makefile
├── README.md
├── src/
│   ├── Assignment.java
│   └── Main.java
└── test/
    ├── AssignmentSuite.java
    ├── AssignmentTest.java
    ├── Feedback.java
    └── OtherTest.java
```

Files in each [Github Classroom](https://classroom.github.com/docs) project that change from assignment to assignment are:

| File | Description |
| --- | --- |
| `./src/*.java` | Assignment [Java](https://docs.oracle.com/en/java/) files are in `./src/`. Runnable code (if any) is in `Main.java` and is run by `make run`. |
| `./test/*Suite.java` | The [lexicographically](https://en.wikipedia.org/wiki/Lexicographic_order) first [Java](https://docs.oracle.com/en/java/) test suite responsible for running the [Junit](https://junit.org/junit4/javadoc/latest/) assignment tests in `./test/*Test.java` is run by `make test` (if it exists). |
| `./test/*Test.java` | Assignment [Java](https://docs.oracle.com/en/java/) [Junit](https://junit.org/junit4/javadoc/latest/) tests in `./test/*Test.java` are run by `make test` (in the absence of `*Suite.java`). |

In this example, 

- `./src/Assignment.java` includes two methods to be tested; 
- `./src/Main.java` has an empty `main` method; 
- `./test/AssignmentSuite.java` exists and runs [Junit](https://junit.org/junit4/javadoc/latest/) tests in `./test/AssignmentTest.java` and `./test/OtherTest.java`; 
- `./test/Feedback.java` is a utility used by `*Test.java`.

<hr>

Files in each [Github Classroom](https://classroom.github.com/docs) project that *do not* change from assignment to assignment are:

| File | Description |
| --- | --- |
|`./.devcontainer/devcontainer.json` | Sets up container for [VSCode](https://code.visualstudio.com/) in [Github Classroom](https://classroom.github.com/docs). |
| `./.gitignore` | Git configuration file as part of every repository. |
| `./.vscode/launch.json` | [VSCode](https://code.visualstudio.com/) launch configurations. |
| `./.vscode/settings.json` | [VSCode](https://code.visualstudio.com/) project settings. |
| `./LICENSE` | License file as part of every repository. |
| `./Makefile` | GNU [Makefile](https://www.gnu.org/software/make/manual/make.html) with `clean`, `build`, `run`, `test`, and `all` targets.. |
| `./README.md` | This file &mdash; Git readme file as part of every repository. |

<hr>

[&#128279; permalink](https://2024-csforma-classroom.github.io/basic-assignment/) and [&#128297; repository](https://github.com/2024-csforma-classroom/basic-assignment) for this page.
