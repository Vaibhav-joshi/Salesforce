#!/bin/bash
set -e

# Usage check
if [ -z "$1" ]; then
  echo "Usage: ./create-feature.sh <branch-suffix>"
  echo "Example: ./create-feature.sh add-login-page"
  exit 1
fi

SUFFIX=$1

# Get Git user name and split into first and last
GIT_NAME=$(git config user.name)

# Extract first and last name from Git name
FIRSTNAME=$(echo "$GIT_NAME" | awk '{print tolower($1)}')
LASTNAME=$(echo "$GIT_NAME" | awk '{print tolower($2)}')

# Validate name extraction
if [ -z "$FIRSTNAME" ] || [ -z "$LASTNAME" ]; then
  echo "❌ Could not extract first and last name from Git config."
  echo "Make sure your Git name is set like: 'Vaibhav Joshi'"
  echo "Run: git config --global user.name 'Vaibhav Joshi'"
  exit 1
fi

FEATURE_BRANCH="feature/${FIRSTNAME}.${LASTNAME}/${SUFFIX}"

# echo "🔍 Checking if branch '$FEATURE_BRANCH' already exists..."

# Check local
if git show-ref --verify --quiet refs/heads/$FEATURE_BRANCH; then
  echo "❌ Branch '$FEATURE_BRANCH' already exists locally!"
  exit 1
fi

# Check remote
if git ls-remote --exit-code --heads origin $FEATURE_BRANCH > /dev/null 2>&1; then
  echo "❌ Branch '$FEATURE_BRANCH' already exists on origin!"
  exit 1
fi

# echo "✅ Branch name is valid and unique."

# Always start from dev-integrated
# echo "Switching to dev-integrated..."
git checkout dev-integrated
git fetch origin
git merge origin/dev-integrated

# Create new branch
# echo "Creating new branch: $FEATURE_BRANCH..."
git checkout -b $FEATURE_BRANCH dev-integrated

# Publish branch
# echo "Publishing branch to origin..."
git push -u origin $FEATURE_BRANCH

echo "🎉 Feature branch '$FEATURE_BRANCH' created from dev-integrated and published successfully!"
