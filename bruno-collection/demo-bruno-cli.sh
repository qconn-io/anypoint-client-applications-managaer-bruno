#!/bin/bash

# Bruno CLI Demo Script for Anypoint Platform Client Applications
# This script demonstrates Bruno CLI by running the entire collection at once
# to maintain environment variables across all requests.

# Colors for output formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration
ENVIRONMENT="dev"

# Function to print colored headers
print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

# Function to print success message
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Function to print error message
print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Function to check if Bruno CLI is installed
check_bruno_cli() {
    if ! command -v bru &> /dev/null; then
        print_error "Bruno CLI is not installed!"
        echo -e "${YELLOW}Please install Bruno CLI first: npm install -g @usebruno/cli${NC}"
        exit 1
    fi
    print_success "Bruno CLI is installed (Version: $(bru --version))"
}

# Main demo function
main() {
    print_header "Bruno CLI Demo - Anypoint Platform Client Applications"
    
    echo -e "${CYAN}This demo runs the entire Bruno collection to demonstrate:${NC}"
    echo "• Authentication - Generate access token"
    echo "• Client Applications - Create, list, get, and update"
    echo "• Credentials - Regenerate client secret"
    echo ""
    echo -e "${YELLOW}Running all requests together maintains environment variables across requests.${NC}"
    echo ""
    
    # Check if Bruno CLI is installed
    check_bruno_cli
    
    # Run the entire collection
    print_header "Running Complete Bruno Collection"
    
    echo -e "${CYAN}Command: bru run --env $ENVIRONMENT${NC}"
    echo ""
    
    # Run all requests and capture result
    if bru run --env "$ENVIRONMENT"; then
        print_success "All requests completed successfully!"
    else
        echo -e "${YELLOW}Some requests may have failed, but demo completed.${NC}"
        echo -e "${YELLOW}This is expected for some API endpoints that may have restrictions.${NC}"
    fi
    
    # Demo completion
    print_header "Demo Completed!"
    
    echo -e "${GREEN}🎉 Bruno CLI demo finished!${NC}"
    echo ""
    echo -e "${CYAN}Key Benefits of Running Complete Collection:${NC}"
    echo "• Environment variables persist across all requests"
    echo "• Access tokens generated in authentication are used in subsequent requests"
    echo "• Client application IDs are passed between create/update/delete operations"
    echo "• Single command execution for the entire workflow"
    echo ""
    echo -e "${CYAN}Usage: ${NC}bru run --env $ENVIRONMENT"
    echo ""
    echo -e "${YELLOW}Check the Bruno collection environment variables to see the stored values.${NC}"
}

# Function to display help
show_help() {
    echo "Bruno CLI Demo Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo ""
    echo "This script demonstrates Bruno CLI by running the entire collection"
    echo "to showcase environment variable persistence across requests."
}

# Parse command line arguments
if [[ $# -gt 0 && "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Run the main demo
main
