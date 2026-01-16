with open("C:/Users/cpils/Documents/EDS Cert/Capstone/birds_issue.csv", 'r') as f:
    data = f.readlines()

birdIssues = set()

for entry in data[1:]: # Removing header line with string slicing
    issues = entry.split(';') # Split the entry, producing a list of issues in this entry
    for issue in issues: # Iterate through each issue
        birdIssues.add(issue.strip()) # Strip the issue and add it to the set

with open("C:/Users/cpils/Documents/EDS Cert/Capstone/allBirdIssues.csv", 'w') as f:
           f.write("Issues\n")
           for issue in birdIssues:
               f.write(issue + "\n")


