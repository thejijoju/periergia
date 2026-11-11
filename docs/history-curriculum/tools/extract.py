"""Print the master markdown body (and quiz JSON) of a supabase/content SQL file."""
import re,sys
s=open(sys.argv[1],encoding="utf-8").read()
m=re.findall(r"\$(\w+)_master\$(.*?)\$\1_master\$",s,re.S)
q=re.findall(r"\$(\w+)_quiz\$(.*?)\$\1_quiz\$",s,re.S)
print(m[0][1] if m else "NO MASTER FOUND")
if q: print("\n\n=== QUIZ JSON ===\n"+q[0][1])
