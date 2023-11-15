load(":register_tests.bzl", "register_pixman_tests")
cc_library(
    name = "pixman_simd",
    srcs = [
        "pixman/pixman-combine32.h",
        "pixman/pixman-compiler.h",
        "pixman/pixman-inlines.h",
    ] + select(
        {
            "@platforms//os:linux": [
                "pixman/pixman-mmx.c",
                "pixman/pixman-sse2.c",
                "pixman/pixman-ssse3.c",
            ],
            "@platforms//os:windows": [
                "pixman/pixman-mmx.c",
                "pixman/pixman-sse2.c",
                "pixman/pixman-ssse3.c",
            ],
            "@platforms//os:macos": [
                "pixman/pixman-arm-asm.h",
                "pixman/pixman-arm-common.h",
                "pixman/pixman-arm-neon.c",
                "pixman/pixman-arma64-neon-asm.S",
                "pixman/pixman-arma64-neon-asm.h",
                "pixman/pixman-arma64-neon-asm-bilinear.S",
            ],
            "//conditions:default": [],
        },
    ),
    hdrs = [
        "pixman/pixman.h",
        "pixman/pixman-private.h",
    ] + select(
        {
            "@platforms//os:linux": [
                "os/linux/pixman/pixman-config.h",
                "os/linux/pixman/pixman-version.h",
            ],
            "@platforms//os:windows": [
                "os/windows/pixman/pixman-config.h",
                "os/windows/pixman/pixman-version.h",
            ],
            "@platforms//os:macos": [
                "os/darwin/pixman/pixman-config.h",
                "os/darwin/pixman/pixman-version.h",
            ],
            "//conditions:default": [],
        },
    ),
    copts = [
        "-DHAVE_CONFIG_H",
    ] + select(
        {
            "@platforms//os:linux": [
                "-mssse3",
                "-Wno-macro-redefined",
            ],
            "@platforms//os:windows": [
                "-mssse3",
                "-DPIXMAN_API=__declspec(dllexport)",
            ],
            "@platforms//os:macos": [
            ],
            "//conditions:default": [],
        },
    ),
    includes = select(
        {
            "@platforms//os:linux": [
                "os/linux/pixman",
            ],
            "@platforms//os:windows": [
                "os/windows/pixman",
            ],
            "@platforms//os:macos": [
                "os/darwin/pixman",
            ],
            "//conditions:default": [],
        },
    ),
)

cc_library(
    name = "pixman-1",
    srcs = [
        "pixman/dither/blue-noise-64x64.h",
        "pixman/loongson-mmintrin.h",
        "pixman/pixman.c",
        "pixman/pixman-access.c",
        "pixman/pixman-access-accessors.c",
        "pixman/pixman-arm.c",
        "pixman/pixman-bits-image.c",
        "pixman/pixman-combine-float.c",
        "pixman/pixman-combine32.c",
        "pixman/pixman-conical-gradient.c",
        "pixman/pixman-edge.c",
        "pixman/pixman-edge-accessors.c",
        "pixman/pixman-fast-path.c",
        "pixman/pixman-filter.c",
        "pixman/pixman-general.c",
        "pixman/pixman-glyph.c",
        "pixman/pixman-gradient-walker.c",
        "pixman/pixman-image.c",
        "pixman/pixman-implementation.c",
        "pixman/pixman-linear-gradient.c",
        "pixman/pixman-matrix.c",
        "pixman/pixman-mips.c",
        "pixman/pixman-noop.c",
        "pixman/pixman-ppc.c",
        "pixman/pixman-radial-gradient.c",
        "pixman/pixman-region16.c",
        "pixman/pixman-region32.c",
        "pixman/pixman-solid-fill.c",
        "pixman/pixman-timer.c",
        "pixman/pixman-trap.c",
        "pixman/pixman-utils.c",
        "pixman/pixman-x86.c",
    ],
    hdrs = [
        "pixman/config.h",
        "pixman/pixman.h",
        "pixman/pixman-access.c",
        "pixman/pixman-accessor.h",
        "pixman/pixman-combine32.h",
        "pixman/pixman-compiler.h",
        "pixman/pixman-edge.c",
        "pixman/pixman-edge-imp.h",
        "pixman/pixman-inlines.h",
        "pixman/pixman-private.h",
        "pixman/pixman-region.c",
    ] + select(
        {
            "@platforms//os:linux": [
                "os/linux/pixman/pixman-config.h",
                "os/linux/pixman/pixman-version.h",
            ],
            "@platforms//os:windows": [
                "os/windows/pixman/pixman-config.h",
                "os/windows/pixman/pixman-version.h",
            ],
            "@platforms//os:macos": [
                "os/darwin/pixman/pixman-config.h",
                "os/darwin/pixman/pixman-version.h",
            ],
            "//conditions:default": [],
        },
    ),
    copts = [
        "-Wno-unused-const-variable",
        "-Wno-unused-local-typedefs",
        "-Wno-expansion-to-defined",
        "-DHAVE_CONFIG_H",
    ],
    includes = ["pixman"] + select(
        {
            "@platforms//os:linux": [
                "os/linux/pixman",
            ],
            "@platforms//os:windows": [
                "os/windows/pixman",
            ],
            "@platforms//os:macos": [
                "os/darwin/pixman",
            ],
            "//conditions:default": [],
        },
    ),
    visibility = ["//visibility:public"],
    deps = [":pixman_simd"],
)

# Basic utils independet of libpng.
cc_library(
    name = "pixman-test-utils",
    srcs = [
        "test/utils.c",
        "test/utils.h",
        "test/utils-prng.c",
        "test/utils-prng.h",
        "pixman/config.h",
    ],
    copts = [
        "-DHAVE_CONFIG_H",
        "-Wno-switch",
    ],
    includes = ["test"],
    deps = [":pixman-1"],
)


 # Commented out ones need png version of utils, which we do not yet have
register_pixman_tests(tests=[
    "a1-trap-test",
    "alpha-loop",
    "combiner-test",
    # "composite", # Too slow..
    "fence-image-self-test",
    "fetch-test",
    "filter-reduction-test",
    "glyph-test",
    "gradient-crash-test",
    "infinite-loop",
    "matrix-test",
    "oob-test",
    "pdf-op-test",
    "pixel-test",
    "prng-test",
    "region-contains-test",
    "region-test",
    "region-translate-test",
    "rotate-test",
    "scaling-crash-test",
    "scaling-helpers-test",
    "trap-crasher",
    # "affine-test",
    # "alphamap",
    # "blitters-test",
    # "composite-traps-test",
    # "cover-test",
    # "radial-invalid",
    # "scaling-test",
    # "solid-test",
    # "stress-test",
    # "tolerance-test", # Needs png
])