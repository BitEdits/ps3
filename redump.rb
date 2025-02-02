require 'nokogiri'
require 'open-uri'
require 'date'

base_url = "http://redump.org/discs/system/ps3/"

(3..10).each do |page|
  games = []
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
         rel = Date.parse(row2.css("td")[6].text)
         offset = 1
       rescue ArgumentError
         offset = 0
         rel = Date.parse(row2.css("td")[5].text) rescue nil
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
             when "Australia, New Zealand" ; "AN"
             when "New Zealand" ; "NZ"
             when "Australia" ; "AU"
             when "Poland" ; "PL"
             when "Russia" ; "RU"
             when "Ireland" ; "IR"
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
      puts "#{page.to_s.rjust(3, '0')} : #{region} : #{code} : #{rel} : #{name}"
      games << { region: region, page: page.to_s.rjust(3, '0'), code: code, name: name, rel: rel }
   end

html_template = <<~HTML
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>PS3 Game List</title>
      <style>
          table {
              width: 100%;
              border-collapse: collapse;
          }
          th, td {
              border: 1px solid #ddd;
              padding: 8px;
              text-align: left;
          }
          th {
              background-color: #f2f2f2;
          }
      </style>
  </head>
  <body>
      <h1>PS3 Game List</h1>
      <table>
          <thead>
              <tr>
                  <th width=1>Page</th>
                  <th width=1>Region</th>
                  <th width=10%>Release</th>
                  <th width=10%>Code</th>
                  <th>Name</th>
              </tr>
          </thead>
          <tbody>
              #{games.map { |game| "<tr><td>#{chunk}</td><td>#{game[:region]}</td><td>#{game[:rel]}</td><td>#{game[:code]}</td><td>#{game[:name]}</td></tr>" }.join("\n")}
          </tbody>
      </table>
  </body>
  </html>
HTML

File.write("ps3_games_#{chunk}.html", html_template)
puts "HTML file generated \"ps3_games_#{chunk}.html\"."

end
