# Strip "develop_" and ensure the result is a valid DNS-1035 label
BRANCH_NAME="develop_s"

if [[ "${BRANCH_NAME}" =~ ^develop_ ]]; then
    FEAT_NAME="${BRANCH_NAME#develop_}"
    # Check if FEAT_NAME is empty and set to default if so
    if [[ -z "${FEAT_NAME}" ]]; then
        FEAT_NAME="default"
    else
        # Replace invalid characters with dashes
        FEAT_NAME=$(echo "${FEAT_NAME}" | tr -cd 'a-z0-9-' | tr -s '-')
        # Ensure it starts with a letter and ends with an alphanumeric character
        if [[ ! "${FEAT_NAME}" =~ ^[a-z] ]]; then
            FEAT_NAME="a${FEAT_NAME}"
        fi
        if [[ ! "${FEAT_NAME}" =~ [a-z0-9]$ ]]; then
            FEAT_NAME="${FEAT_NAME}0"
        fi
    fi
    PROJECT_NAME="${REPO_NAME}-${FEAT_NAME}"
else
    echo "Unknown branch. Exiting."
    exit 1
fi

echo $FEAT_NAME
