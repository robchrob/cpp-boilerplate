#define CATCH_CONFIG_MAIN
#include <catch.hpp>

TEST_CASE("SIMPLE TEST", "[main]")
{
    REQUIRE(1 == 1) ;
}
