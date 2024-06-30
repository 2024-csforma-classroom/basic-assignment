# Makefile assisted and explained with Chat-GPT
# https://chatgpt.com/share/c267b7d9-c9dd-4593-960f-edd2ae49cb38

# Variables
SRC_DIR = src
TEST_DIR = test
BUILD_DIR = build
LIB_DIR = lib
JUNIT_VERSION = 4.13.2
HAMCREST_VERSION = 2.2
JUNIT_JAR = $(LIB_DIR)/junit-$(JUNIT_VERSION).jar
HAMCREST_JAR = $(LIB_DIR)/hamcrest-$(HAMCREST_VERSION).jar
LIBS = $(JUNIT_JAR):$(HAMCREST_JAR)
CLASSPATH = $(LIBS):$(BUILD_DIR)
# https://arc.net/l/quote/whfjwudm Depricated APCS features > JDK 8
JAVAC_FLAGS = --release 8 -Xlint:-options
JAVA_FLAGS = -ea

# Find all .java files in the src and test directories using find
SRC_FILES = $(shell find $(SRC_DIR) -name "*.java" |sort)
TEST_FILES = $(shell find $(TEST_DIR) -name "*.java" |sort)
ALL_FILES = $(SRC_FILES) $(TEST_FILES)

# Convert .java file paths to .class file paths
SRC_CLASSES = $(patsubst $(SRC_DIR)/%.java,$(BUILD_DIR)/%.class,$(SRC_FILES))
TEST_CLASSES = $(patsubst $(TEST_DIR)/%.java,$(BUILD_DIR)/%.class,$(TEST_FILES))
ALL_CLASSES = $(SRC_CLASSES) $(TEST_CLASSES)

# Default target
.PHONY: all
all: test
	@echo "Valid make targets are: clean build run test all debug"

# Build target
.PHONY: build
build: $(JUNIT_JAR) $(HAMCREST_JAR) $(ALL_CLASSES)

# Download dependencies if they don't exist
$(JUNIT_JAR):
	@mkdir -p $(LIB_DIR)
	curl -o \
    $@ https://repo1.maven.org/maven2/junit/junit/$(JUNIT_VERSION)/junit-$(JUNIT_VERSION).jar

$(HAMCREST_JAR):
	@mkdir -p $(LIB_DIR)
	curl -o $@ \
    https://repo1.maven.org/maven2/org/hamcrest/hamcrest/$(HAMCREST_VERSION)/hamcrest-$(HAMCREST_VERSION).jar

# Rule to compile .java files to .class files
$(ALL_CLASSES): $(ALL_FILES)
	@mkdir -p $(BUILD_DIR)
	javac -cp $(CLASSPATH) $(JAVAC_FLAGS) -d $(BUILD_DIR) \
    $(SRC_FILES) \
    $(TEST_FILES)
# $(ALL_FILES) = $(SRC_FILES) $(TEST_FILES)

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Run target
.PHONY: run
run: build
	java -cp $(CLASSPATH):$(BUILD_DIR) $(JAVA_FLAGS) \
    Main

# Test targets
.PHONY: test
test: build
	@echo "\n### Running unit tests..."
	@files=$$(find $(BUILD_DIR) -name '*Suite.class'); \
	if [ -n "$$files" ]; then \
		$(MAKE) run_suite; \
	else \
		$(MAKE) run_tests; \
	fi

.PHONY: run_suite
run_suite:
	java -cp $(CLASSPATH):$(BUILD_DIR) $(JAVA_FLAGS) \
    $(patsubst %.class,%,$(filter %Suite.class,$(notdir $(TEST_CLASSES))))

.PHONY: run_tests
run_tests:
	java -cp $(CLASSPATH):$(BUILD_DIR) $(JAVA_FLAGS) org.junit.runner.JUnitCore \
    $(patsubst %.class,%,$(filter %Test.class,$(notdir $(TEST_CLASSES))))

# Debug: Print variables
.PHONY: debug
debug:
	$(info SRC_DIR=$(SRC_DIR))
	$(info TEST_DIR=$(TEST_DIR))
	$(info BUILD_DIR=$(BUILD_DIR))
	$(info LIB_DIR=$(LIB_DIR))
	$(info JUNIT_VERSION=$(JUNIT_VERSION))
	$(info HAMCREST_VERSION=$(HAMCREST_VERSION))
	$(info JUNIT_JAR=$(JUNIT_JAR))
	$(info HAMCREST_JAR=$(HAMCREST_JAR))
	$(info LIBS=$(LIBS))
	$(info CLASSPATH=$(CLASSPATH))
	$(info JAVA_FLAGS=$(JAVA_FLAGS))
	$(info JAVAC_FLAGS=$(JAVAC_FLAGS))
	$(info SRC_FILES=$(SRC_FILES))
	$(info TEST_FILES=$(TEST_FILES))
	$(info ALL_FILES=$(ALL_FILES))
	$(info SRC_CLASSES=$(SRC_CLASSES))
	$(info TEST_CLASSES=$(TEST_CLASSES))
	$(info ALL_CLASSES=$(ALL_CLASSES))
