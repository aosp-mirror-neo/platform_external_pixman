load("@rules_cc//cc:defs.bzl", "cc_test")

def register_pixman_tests(tests):
    for test in tests:
        cc_test(
            name = test,
            size = "small",
            srcs = [
                "test/" + test + ".c",
            ],
            copts = [
                "-Wno-implicit-function-declaration",
                "-Wno-format",
                "-Wno-switch",
                "-DHAVE_CONFIG_H",
            ],
            deps = [
                ":pixman-test-utils",
            ],
        )
