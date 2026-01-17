# Janitor
Your file system's best friend . Keeping things tidy, one sweep at a time. Reclaim disk space with smart duplicate detection, rule-based cleanup, and size analysis. Features dry-run mode, quarantine system, and flexible filtering. Perfect for developers and sysadmins who need precision file management.

## 📁 Project Structure

```
Janitor/
├── Makefile.PL
├── README.md
├── LICENSE
├── MANIFEST
├── Changes
│
├── bin/
│   ├── j-cleaner
│   ├── j-analyze
│   └── j-duplicates
│
├── lib/
│   ├── Janitor.pm
│   └── Janitor/
│       ├── Config.pm
│       ├── CLI.pm
│       ├── DuplicateDetector.pm
│       ├── SizeAnalyzer.pm
│       ├── CleanupEngine.pm
│       ├── Quarantine.pm
│       ├── Logger.pm
│       └── Utils.pm
│
├── t/
│   ├── 01-basic.t
│   ├── 02-config.t
│   ├── 03-duplicates.t
│   ├── 04-cleanup.t
│   └── 99-pod.t
│
├── config/
│   ├── example.yml
│   ├── cleanup_rules.yml
│   └── README.md
│
├── scripts/
│   ├── install.sh
│   ├── benchmark.pl
│   └── migrate_config.pl
│
└── doc/
    ├── API.md
    ├── EXAMPLES.md
    ├── PERFORMANCE.md
    └── CHANGELOG.md
```

## 📝 License

This project is licensed under the Mozilla Public License Version 2.0 - see the [LICENSE.md](LICENSE.md) file for more details.
