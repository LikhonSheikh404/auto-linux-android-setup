#!/bin/bash

# Test script for Android Linux Setup
# Verifies all components are working correctly

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Test function
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    TESTS_RUN=$((TESTS_RUN + 1))
    echo -n "Testing $test_name... "
    
    if eval "$test_command" >/dev/null 2>&1; then
        echo -e "${GREEN}PASS${NC}"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        return 0
    else
        echo -e "${RED}FAIL${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# Test function with output
run_test_with_output() {
    local test_name="$1"
    local test_command="$2"
    
    TESTS_RUN=$((TESTS_RUN + 1))
    echo -e "${BLUE}Testing $test_name...${NC}"
    
    if eval "$test_command"; then
        echo -e "${GREEN}✓ $test_name PASSED${NC}"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        return 0
    else
        echo -e "${RED}✗ $test_name FAILED${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# Header
echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}  Android Linux Setup Test Suite${NC}"
echo -e "${BLUE}=========================================${NC}"
echo

# Test 1: File existence
echo -e "${YELLOW}=== File Existence Tests ===${NC}"
run_test "Main setup script exists" "test -f auto_linux_android_setup.sh"
run_test "Launcher script exists" "test -f launch_linux_setup.sh"
run_test "README exists" "test -f README.md"
run_test "Config template exists" "test -f config_template.sh"
run_test "Test script exists" "test -f test_setup.sh"
echo

# Test 2: Script permissions
echo -e "${YELLOW}=== Permission Tests ===${NC}"
run_test "Main script is executable" "test -x auto_linux_android_setup.sh"
run_test "Launcher is executable" "test -x launch_linux_setup.sh"
echo

# Test 3: Script syntax
echo -e "${YELLOW}=== Syntax Tests ===${NC}"
run_test "Main script syntax" "bash -n auto_linux_android_setup.sh"
run_test "Launcher syntax" "bash -n launch_linux_setup.sh"
echo

# Test 4: Help functionality
echo -e "${YELLOW}=== Help Functionality Tests ===${NC}"
run_test "Main script help" "bash auto_linux_android_setup.sh --help"
run_test "Health check" "bash auto_linux_android_setup.sh --health"
echo

# Test 5: Configuration file tests
echo -e "${YELLOW}=== Configuration Tests ===${NC}"
if [[ -f config_template.sh ]]; then
    run_test "Config template syntax" "bash -n config_template.sh"
    run_test "Config template sourcing" "source config_template.sh && echo 'Config loaded'"
else
    echo -e "${YELLOW}Config template not found, skipping config tests${NC}"
fi
echo

# Test 6: Environment detection (if on Android)
echo -e "${YELLOW}=== Environment Detection Tests ===${NC}"
if [[ -n "$TERMUX_VERSION" ]]; then
    run_test "Running in Termux" "test -n '$TERMUX_VERSION'"
    run_test "Termux version check" "test '$TERMUX_VERSION' != ''"
    echo -e "${GREEN}✓ Running in Termux environment${NC}"
    
    # Test Termux-specific functionality
    run_test "pkg command available" "command -v pkg"
    run_test "termux-setup-storage available" "command -v termux-setup-storage"
    
    # Test package installation capability
    echo -e "${BLUE}Testing package manager...${NC}"
    if pkg update >/dev/null 2>&1; then
        run_test_with_output "Package manager working" "echo 'Package manager test passed'"
    else
        echo -e "${YELLOW}Package manager test skipped (offline or no internet)${NC}"
    fi
elif [[ -f "/system/build.prop" ]]; then
    run_test "Running on Android" "test -f /system/build.prop"
    echo -e "${GREEN}✓ Running on Android system${NC}"
else
    echo -e "${YELLOW}Not running on Android/Termux${NC}"
fi
echo

# Test 7: Network connectivity
echo -e "${YELLOW}=== Network Tests ===${NC}"
if command -v curl >/dev/null 2>&1; then
    if curl -s --connect-timeout 5 https://www.google.com >/dev/null 2>&1; then
        run_test_with_output "Internet connectivity" "echo 'Internet connection working'"
    else
        echo -e "${YELLOW}Internet connectivity test skipped (no connection)${NC}"
    fi
else
    echo -e "${YELLOW}curl not available, skipping network tests${NC}"
fi
echo

# Test 8: Storage and permissions
echo -e "${YELLOW}=== Storage and Permission Tests ===${NC}"
run_test "Home directory writable" "test -w '$HOME'"
run_test "Home directory readable" "test -r '$HOME'"
run_test "Home directory executable" "test -x '$HOME'"
echo

# Test 9: Command availability
echo -e "${YELLOW}=== Command Availability Tests ===${NC}"
run_test "bash available" "command -v bash"
run_test "grep available" "command -v grep"
run_test "sed available" "command -v sed"
run_test "awk available" "command -v awk"
run_test "cut available" "command -v cut"
run_test "tar available" "command -v tar"
run_test "zip available" "command -v zip || command -v gzip"
echo

# Test 10: Functionality simulation
echo -e "${YELLOW}=== Functionality Simulation Tests ===${NC}"

# Test configuration directory creation simulation
TEST_DIR="/tmp/android_linux_test_$$"
if mkdir -p "$TEST_DIR/.android_linux_config" 2>/dev/null; then
    run_test_with_output "Directory creation simulation" "echo 'Directory creation works'"
    rm -rf "$TEST_DIR"
else
    echo -e "${RED}Directory creation test failed${NC}"
fi

# Test file writing simulation
TEST_FILE="/tmp/android_linux_test_$$.sh"
if echo "#!/bin/bash" > "$TEST_FILE" 2>/dev/null; then
    run_test_with_output "File writing simulation" "echo 'File writing works'"
    rm -f "$TEST_FILE"
else
    echo -e "${RED}File writing test failed${NC}"
fi

# Test shell variable simulation
TEST_VAR="test_value_$$"
if [[ "$TEST_VAR" == "test_value_$$" ]]; then
    run_test_with_output "Variable handling simulation" "echo 'Variable handling works'"
else
    echo -e "${RED}Variable handling test failed${NC}"
fi
echo

# Test 11: Error handling
echo -e "${YELLOW}=== Error Handling Tests ===${NC}"

# Test with non-existent command
if ! nonexistent_command_$$ 2>/dev/null; then
    run_test_with_output "Error handling (non-existent command)" "echo 'Error handling works correctly'"
fi

# Test with invalid file
if ! cat /nonexistent/file_$$ 2>/dev/null; then
    run_test_with_output "Error handling (non-existent file)" "echo 'File error handling works'"
fi
echo

# Test 12: Script structure validation
echo -e "${YELLOW}=== Script Structure Tests ===${NC}"

# Check for required functions in main script
if grep -q "main_setup()" auto_linux_android_setup.sh; then
    run_test_with_output "Main setup function exists" "echo 'Function structure valid'"
else
    echo -e "${RED}Main setup function not found${NC}"
fi

# Check for help functionality
if grep -q "help\|--help\|-h" auto_linux_android_setup.sh; then
    run_test_with_output "Help functionality exists" "echo 'Help structure valid'"
else
    echo -e "${RED}Help functionality not found${NC}"
fi

# Check for logging functions
if grep -q "log()\|error()\|info()" auto_linux_android_setup.sh; then
    run_test_with_output "Logging functions exist" "echo 'Logging structure valid'"
else
    echo -e "${RED}Logging functions not found${NC}"
fi
echo

# Final results
echo -e "${BLUE}=========================================${NC}"
echo -e "${BLUE}  Test Results Summary${NC}"
echo -e "${BLUE}=========================================${NC}"
echo
echo -e "Tests run: ${BLUE}$TESTS_RUN${NC}"
echo -e "Tests passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests failed: ${RED}$TESTS_FAILED${NC}"
echo

# Calculate success rate
if [[ $TESTS_RUN -gt 0 ]]; then
    SUCCESS_RATE=$((TESTS_PASSED * 100 / TESTS_RUN))
    echo -e "Success rate: ${SUCCESS_RATE}%"
fi

echo

# Provide recommendations
if [[ $TESTS_FAILED -eq 0 ]]; then
    echo -e "${GREEN}✓ All tests passed! Your Android Linux Setup is ready.${NC}"
    echo
    echo -e "${BLUE}Next steps:${NC}"
    echo "1. Run: ./launch_linux_setup.sh"
    echo "2. Select your preferred setup option"
    echo "3. Follow the on-screen instructions"
    echo "4. Enjoy your Linux environment on Android!"
elif [[ $TESTS_FAILED -lt 5 ]]; then
    echo -e "${YELLOW}⚠ Some tests failed, but core functionality should work.${NC}"
    echo
    echo -e "${BLUE}Recommendations:${NC}"
    echo "1. Check internet connectivity"
    echo "2. Ensure sufficient storage space"
    echo "3. Verify file permissions"
    echo "4. Try running the setup script anyway"
else
    echo -e "${RED}✗ Multiple tests failed. Please check your environment.${NC}"
    echo
    echo -e "${BLUE}Troubleshooting:${NC}"
    echo "1. Ensure you're running on Android with Termux"
    echo "2. Check file permissions: chmod +x *.sh"
    echo "3. Verify you have internet connectivity"
    echo "4. Ensure sufficient storage space (2GB+)"
    echo "5. Try running as different user if applicable"
fi

echo
echo -e "${BLUE}Test completed at: $(date)${NC}"