import sys
import json
import csv

def convert_json_to_csv(json_file):
    with open(json_file, 'r') as file:
        data = json.load(file)

    csv_data = []
    for user in data['data']['users']:
        email = user['email']
        if not email.endswith('@swarmfarm.com'):
            csv_data.append(email)

    csv_file = json_file.replace('.json', '.csv')
    with open(csv_file, 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(csv_data)

    print(f"CSV file '{csv_file}' has been created successfully!")

def print_help():
    print("Usage: python script.py <json_file>")
    print("This script takes a JSON file as input and creates a CSV file with filtered emails.")
    print("The output CSV file will have the same name as the input JSON file but with the .csv extension.")
    print("Emails with the @swarmfarm.com domain will be excluded from the output CSV file.")

if __name__ == "__main__":
    if len(sys.argv) != 2 or sys.argv[1] in {'-h', '--help'}:
        print_help()
        sys.exit()

    json_file_name = sys.argv[1]
    convert_json_to_csv(json_file_name)

