# encoding: utf-8
branches = STDIN.read.chomp
if !branches.empty?
  branch = branches.split("\n").map(&:strip)[0].split(' ').map(&:strip)[-1]
  is_clean = branches.include?("nothing to commit, working tree clean")
  if !branches.empty?
    if is_clean
      puts " ✔︎ #{branch}"
    else
      puts "\e[0;31m" + " ✗ #{branch}"
    end
  end
end
