import sys
import os
import re

if __name__ == "__main__":
    path = sys.argv[1]
    student_alias = "TZ404271"
    lab_regex = "[L|l]ab\d{2,}"
    
    try:
        with open(path) as commit:
            commit_title = commit.readline()
            if student_alias not in commit_title:
                print("title not working")
                sys.exit(1)
            
            commit.readline()
            commit_message = commit.readline()
            print("commit message:", commit_message)
            result = re.match(lab_regex, commit_message)
            if result is None:
                print("message not working")
                sys.exit(1)
    except:
        print("Some errror occured")
        sys.exit(1)

    sys.exit(0)
