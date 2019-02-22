class FileReader
  def self.read_file(filename)
    file = File.open(filename, "r")
    wordList = Array.new
    file.each_line do |line|
      wordList.push(line.split(" ")[0])
    end
    wordList
  end

  def self.get_longest_word(wordList)
    longestWord = ""
    fullWordsLength = 0
    for word in wordList
      fullWordsLength += word.length
      if (word.length > longestWord.length)
        longestWord = word
      end
    end
    return fullWordsLength, longestWord
  end

  def self.get_shortest_word(longestWord, wordList)
    shortestWord = longestWord;
    for word in wordList
      if (word.length < shortestWord.length)
        shortestWord = word
      end
    end
    shortestWord
  end

  def self.print_word_statistic(filename)
    wordList = read_file(filename)
    fullWordsLength, longestWord = get_longest_word(wordList)
    shortestWord = get_shortest_word(longestWord, wordList)
    puts "===#{filename}==="
    puts "Longest Word -> #{longestWord}"
    puts "Shortest Word -> #{shortestWord}"
    puts "Average Word Length -> #{fullWordsLength / wordList.length}"
    puts "Number of Words -> #{wordList.length}"
    puts ""
  end

  filenames = %w(pl_full.txt en_full.txt)
  for filename in filenames
    print_word_statistic(filename)
  end
end