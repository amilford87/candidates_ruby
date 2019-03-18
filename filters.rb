# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find{ |x| x[:id] == id}
end

def experienced?(candidate)
  candidate[:years_of_experience] >=2
end

def good_points?(candidate)
  candidate[:github_points] >= 100
end

def knows_ruby?(candidate)
  candidate[:languages].any? { |l| l == "Python" || l == "Ruby"}
end

def applied_recently?(candidate)
  0.days.ago.to_date - candidate[:date_applied] <= 15
end

def of_age?(candidate)
  candidate[:age] > 17
end

def qualified_candidates(candidates)
  candidates.select {|c| experienced?(c) && good_points?(c) && 
knows_ruby?(c) && applied_recently?(c) && of_age?(c)}
end

def ordered_by_qualifications(candidates)
  candidates.sort { |a,b| [b[:years_of_experience], b[:github_points]] <=> [a[:years_of_experience], a[:github_points]]}
end

