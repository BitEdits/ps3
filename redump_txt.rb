require 'nokogiri'
require 'open-uri'
require 'date'

base_url = "http://redump.org/discs/system/ps3/"
games = []

(1..9).each do |page|
  url = "#{base_url}?page=#{page}"
  puts "Fetching data from: #{url}"
  chunk = page
  html = URI.open(url).read
  doc = Nokogiri::HTML(html)
  table = doc.css("table") # Select the table
  table.css("tr").each_with_index do |row, index|
    columns = row.css("td")
    next if columns.length < 7 # Ensure the row has enough columns
    nameCol   = columns[1]
    link = "http://redump.org#{nameCol.css('a').attr('href')}"
    release = URI.open(link).read
    releaseDoc = Nokogiri::HTML(release)
    tableGame = releaseDoc.css("table") # Select the table
    name   = releaseDoc.css("h1").text
    rel = []
    offset = 0

    releaseDoc.css("table").each_with_index do |row2,index2|
       next if index2 != 0
       begin
         rel = Date.parse(row2.css("td")[8].text) rescue
         rel = Date.parse(row2.css("td")[7].text) rescue
         rel = Date.parse(row2.css("td")[6].text) rescue
         rel = Date.parse(row2.css("td")[5].text) rescue
         rel = Date.parse(row2.css("td")[4].text) rescue
         rel = Date.parse(row2.css("td")[3].text) rescue nil
       end
    end

    region = case columns[0].css("img").attr("title").text.strip
             when "Japan" ;"JP"
             when "Europe" ; "EU"
             when "Korea" ; "KR"
             when "Japan, Korea" ; "JK"
             when "USA" ; "US"
             when "Spain" ; "ES"
             when "Spain, Portugal" ; "PS"
             when "Asia" ; "AS"
             when "Japan, Asia" ; "JA"
             when "Greece" ; "GR"
             when "Italy" ; "IT"
             when "Germany" ; "GE"
             when "France" ; "FR"
             when "Europe, Australia" ; "EA"
             when "Austria, Switzerland" ; "AW"
             when "Europe, Asia" ; "EB"
             when "Australia, New Zealand" ; "AN"
             when "New Zealand" ; "NZ"
             when "Australia" ; "AU"
             when "Poland" ; "PL"
             when "Russia" ; "RU"
             when "Ireland" ; "IR"
             when "Turkey" ; "TR"
             when "World" ; "WO"
             when "Belgium, Netherlands" ; "BN"
             when "China" ; "CN"
             when "India" ; "IN"
             when "Taiwan" ; "TW"
             when "Latin America" ; "LA"
             when "Brazil" ; "BR"
             when "Belgium" ; "BE"
             when "Norway" ; "NO"
             when "Finland" ; "FI"
             when "Switzerland" ; "CH"
             when "UK, Australia" ; "UA"
             when "USA, Asia" ; "UC"
             when "USA, Korea" ; "UG"
             when "USA, Japan" ; "UJ"
             when "UK" ; "UK"
             when "Netherlands" ; "NL"
             when "Sweden" ; "SW"
             when "France, Spain" ; "FS"
             when "Denmark" ; "DK"
             when "USA, Canada" ; "UC"
             when "USA, Brazil" ; "UB"
             when "Canada" ; "CA"
             when "Austria" ; "AT"
             when "Portugal" ; "PO"
             when "Scandinavia" ; "SC"
             else columns[0].css("img").attr("title").text.strip
      end
      code   = columns[6].text.strip.gsub(" …", "").gsub(" ", "-")
      puts "#{page} · #{region} · #{code} · #{name}"
      games << { region: region, page: page.to_s.rjust(3, '0'), code: code, name: name, rel: rel }
   end


end

html_template = <<~TXT
 #{games.map { |game| "#{game[:region]} · #{game[:code]} · #{game[:name]}" }.join("\n") }
TXT

File.write("PS3-BD.txt", html_template)
puts "HTML file generated \"PS3-BD.txt\"."
