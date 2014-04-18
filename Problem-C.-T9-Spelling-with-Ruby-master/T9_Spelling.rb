_key = {
	"abc" => "2",
	"def" => "3",
	"ghi" => "4",
	"jkl" => "5",
	"mno" => "6",
	"pqrs" => "7",
	"tuv" => "8",
	"wxyz" => "9",
	"0" => "0"
}

key = {}

_key.each do |k, v|
	k.split('').each_with_index do |l, i|
		key[l] = v * (i + 1)
	end
end

File.readlines('input.txt').each_with_index do |line, n|
	output = ""
	last_key = ""
	line.to_s.chomp.gsub(" ", "0").chars do |c|
		output << ' ' if !last_key.nil? and last_key == key[c].to_s[0]
		output << key[c]
		last_key = key[c].to_s[0]
	end
	p "Case ##{n}: #{output}"
end
