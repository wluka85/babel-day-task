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
    wordList.each {|word|
      fullWordsLength += word.length
      if (word.length > longestWord.length)
        longestWord = word
      end
    }
    return fullWordsLength, longestWord
  end

  def self.get_shortest_word(longestWord, wordList)
    shortestWord = longestWord;
    wordList.each {|word|
      if (word.length < shortestWord.length)
        shortestWord = word
      end
    }
    shortestWord
  end

  def self.print_word_statistic(filename, wordList)
    fullWordsLength, longestWord = get_longest_word(wordList)
    shortestWord = get_shortest_word(longestWord, wordList)
    puts "===#{filename}==="
    puts "Longest Word -> #{longestWord}"
    puts "Shortest Word -> #{shortestWord}"
    puts "Average Word Length -> #{fullWordsLength / wordList.length}"
    puts "Number of Words -> #{wordList.length}"
    puts ""
  end

  def self.get_words_array
    plWords = read_file("pl_full.txt")
    enWords = read_file("en_full.txt")
    return enWords, plWords
  end

  def self.run_statistic
    enWords, plWords = get_words_array()

    print_word_statistic("en_full.txt", enWords)
    print_word_statistic("pl_full.txt", plWords)

    commonWords = plWords & enWords
    puts "Common Words -> #{commonWords}"
    puts "Count -> #{commonWords.length}"
  end

  run_statistic
end