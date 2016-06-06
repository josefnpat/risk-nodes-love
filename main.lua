function love.load()

  json = require "json"

  img = love.graphics.newImage("large.png")

  countries = {
    alaska = {
      name = "Alaska",
      links = {
        "northwestterritory",
        "alberta",
        "kamchatka",
      },
      continent = "northamerica",
    },
    northwestterritory = {
      name = "Nort West Territory",
      links = {
        "greenland",
        "ontario",
        "alberta",
        "alaska",
      },
      continent = "northamerica",
    },
    greenland = {
      name = "Greenland",
      links = {
        "iceland",
        "quebec",
        "ontario",
        "northwestterritory",
      },
      continent = "northamerica",
    },
    alberta = {
      name = "Alberta",
      links = {
        "northwestterritory",
        "ontario",
        "westernunitedstates",
        "alaska",
      },
      continent = "northamerica",
    },
    ontario = {
      name = "Ontario",
      links = {
        "northwestterritory",
        "greenland",
        "quebec",
        "easternunitedstates",
        "westernunitedstates",
        "alberta",
      },
      continent = "northamerica",
    },
    quebec = {
      name = "Quebec",
      links = {
        "greenland",
        "easternunitedstates",
        "ontario",
      },
      continent = "northamerica",
    },
    westernunitedstates = {
      name = "Western United States",
      links = {
        "alberta",
        "ontario",
        "easternunitedstates",
        "centralamerica",
      },
      continent = "northamerica",
    },
    easternunitedstates = {
      name = "Eastern United States",
      links = {
        "ontario",
        "quebec",
        "centralamerica",
        "westernunitedstates",
      },
      continent = "northamerica",
    },
    centralamerica = {
      name = "Central America",
      links = {
        "westernunitedstates",
        "easternunitedstates",
        "venezuela",
      },
      continent = "northamerica",
    },
    venezuela = {
      name = "Venezuela",
      links = {
        "brazil",
        "peru",
        "centralamerica",
      },
      continent = "southamerica",
    },
    peru = {
      name = "Peru",
      links = {
        "venezuela",
        "brazil",
        "argentina",
      },
      continent = "southamerica",
    },
    brazil = {
      name = "Brazil",
      links = {
        "northafrica",
        "argentina",
        "peru",
        "venezuela",
      },
      continent = "southamerica",
    },
    argentina = {
      name = "Argentina",
      links = {
        "peru",
        "brazil",
      },
      continent = "southamerica",
    },
    northafrica = {
      name = "North Africa",
      links = {
        "westerneurope",
        "southerneurope",
        "egypt",
        "eastafrica",
        "congo",
        "brazil",
      },
      continent = "africa",
    },
    egypt = {
      name = "Egpyt",
      links = {
        "southerneurope",
        "middleeast",
        "eastafrica",
        "northafrica",
      },
      continent = "africa",
    },
    eastafrica = {
      name = "East Africa",
      links = {
        "egypt",
        "middleeast",
        "madagascar",
        "southafrica",
        "congo",
        "northafrica",
      },
      continent = "africa",
    },
    congo = {
      name = "Congo",
      links = {
        "northafrica",
        "eastafrica",
        "southafrica",
      },
      continent = "africa",
    },
    southafrica = {
      name = "South Africa",
      links = {
        "congo",
        "eastafrica",
        "madagascar",
      },
      continent = "africa",
    },
    madagascar = {
      name = "Madagascar",
      links = {
        "eastafrica",
        "southafrica",
      },
      continent = "africa",
    },
    iceland = {
      name = "Iceland",
      links = {
        "scandinavia",
        "greatbritan",
        "greenland",
      },
      continent = "europe",
    },
    scandinavia = {
      name = "Scandinavia",
      links = {
        "ukraine",
        "northerneurope",
        "greatbritan",
        "iceland",
      },
      continent = "europe",
    },
    ukraine = {
      name = "Ukraine",
      links = {
        "ural",
        "afghanistan",
        "middleeast",
        "southerneurope",
        "northerneurope",
        "scandinavia",
      },
      continent = "europe",
    },
    greatbritan = {
      name = "Great Britan",
      links = {
        "iceland",
        "scandinavia",
        "northerneurope",
        "westerneurope",
      },
      continent = "europe",
    },
    northerneurope = {
      name = "Northern Europe",
      links = {
        "scandinavia",
        "ukraine",
        "southerneurope",
        "westerneurope",
        "greatbritan",
      },
      continent = "europe",
    },
    westerneurope = {
      name = "Western Europe",
      links = {
        "greatbritan",
        "northerneurope",
        "southerneurope",
        "northafrica",
      },
      continent = "europe",
    },
    southerneurope = {
      name = "Southern Europe",
      links = {
        "northerneurope",
        "ukraine",
        "middleeast",
        "egypt",
        "northafrica",
        "westerneurope",
      },
      continent = "europe",
    },
    ural = {
      name = "Ural",
      links = {
        "siberia",
        "china",
        "afghanistan",
        "ukraine",
      },
      continent = "asia",
    },
    siberia = {
      name = "Siberia",
      links = {
        "yakutsk",
        "irkutsk",
        "mongolia",
        "china",
        "ural",
      },
      continent = "asia",
    },
    yakutsk = {
      name = "Yakutsk",
      links = {
        "kamchatka",
        "irkutsk",
        "siberia",
      },
      continent = "asia",
    },
    kamchatka = {
      name = "Kamchatka",
      links = {
        "alaska",
        "japan",
        "mongolia",
        "irkutsk",
        "yakutsk",
      },
      continent = "asia",
    },
    irkutsk = {
      name = "Irkutsk",
      links = {
        "yakutsk",
        "kamchatka",
        "mongolia",
        "siberia",
      },
      continent = "asia",
    },
    mongolia = {
      name = "Mongolia",
      links = {
        "irkutsk",
        "kamchatka",
        "japan",
        "china",
        "siberia",
      },
      continent = "asia",
    },
    japan = {
      name = "Japan",
      links = {
        "kamchatka",
        "mongolia",
      },
      continent = "asia",
    },
    afghanistan = {
      name = "Afghanistan",
      links = {
        "ural",
        "china",
        "india",
        "middleeast",
        "ukraine",
      },
      continent = "asia",
    },
    china = {
      name = "China",
      links = {
        "siberia",
        "mongolia",
        "siam",
        "india",
        "afghanistan",
        "ural",
      },
      continent = "asia",
    },
    middleeast = {
      name = "Middle East",
      links = {
        "ukraine",
        "afghanistan",
        "india",
        "eastafrica",
        "egypt",
        "southerneurope",
      },
      continent = "asia",
    },
    india = {
      name = "India",
      links = {
        "afghanistan",
        "china",
        "siam",
        "middleeast",
      },
      continent = "asia",
    },
    siam = {
      name = "Siam",
      links = {
        "china",
        "indonesia",
        "india",
      },
      continent = "asia",
    },
    indonesia = {
      name = "Indonesia",
      links = {
        "siam",
        "newguinea",
        "westernaustralia",
      },
      continent = "australia",
    },
    newguinea = {
      name = "New Guinea",
      links = {
        "easternaustralia",
        "westernaustralia",
        "indonesia",
      },
      continent = "australia",
    },
    westernaustralia = {
      name = "Western Australia",
      links = {
        "indonesia",
        "newguinea",
        "easternaustralia",
      },
      continent = "australia",
    },
    easternaustralia = {
      name = "Eastern Australia",
      links = {
        "newguinea",
        "westernaustralia",
      },
      continent = "australia",
    },
  }

  continents = {
    northamerica = {
      name = "North America",
      color = {255,255,0},
    },
    southamerica = {
      name = "South America",
      color = {0,255,255},
    },
    africa = {
      name = "Africa",
      color = {255,0,0},
    },
    europe = {
      name = "Europe",
      color = {0,0,255},
    },
    asia = {
      name = "Asia",
      color = {0,255,0},
    },
    australia = {
      name = "Australia",
      color = {255,0,255},
    },
  }

  if love.filesystem.exists("location.json") then
    local raw_locdata = love.filesystem.read("location.json")
    locdata = json.decode(raw_locdata)
  else
    locdata = {}
  end

  local i = 0
  for icountry,country in pairs(countries) do
    if locdata[icountry] then
      country.x,country.y = locdata[icountry].x,locdata[icountry].y
    else
      i = i + 1
      country.x = i*32
      country.y = 64
    end
  end

end

function love.draw()
  love.graphics.setColor(255,255,255)
  love.graphics.draw(img)
  for icountry,country in pairs(countries) do
    if selected == country then
      love.graphics.setColor(0,255,0)
    else
      love.graphics.setColor(0,0,0,63)
    end
    love.graphics.circle("line",country.x,country.y,32)
    for iscountry,scountry in pairs(country.links) do
      assert(countries[scountry],"no country `"..scountry.."`")
      local found = false
      for _,linkcountry in pairs(countries[scountry].links) do
        if linkcountry == icountry then
          found = true
          break
        end
      end
      assert(found,"Missing link from `"..scountry.."` to `"..icountry.."`")
      love.graphics.line(
        country.x,country.y,
        countries[scountry].x,countries[scountry].y)
    end
  end
  for icountry,country in pairs(countries) do
    assert(country.continent,"no country continent for `"..icountry.."`")
    assert(continents[country.continent],"no continent `"..country.continent.."`")
    love.graphics.setColor(continents[country.continent].color)
    love.graphics.circle("fill",country.x,country.y,32)
    love.graphics.setColor(0,0,0)
    love.graphics.printf(country.name,country.x-32,country.y,64,"center")
  end
  for icontinent,continent in pairs(continents) do
    local cx,cy,c = nil,nil,0
    for icountry,country in pairs(countries) do
      if icontinent == country.continent then
        c = c + 1
        cx = cx and (cx + country.x) or country.x
        cy = cy and (cy + country.y) or country.y
      end
    end
    assert(cx and cy,"No countries in continent `"..icontinent.."`")
    love.graphics.print(continent.name,cx/c,cy/c)
  end
end

function love.update(dt)
  if selected then
    selected.x,selected.y = love.mouse.getPosition()
  end
end

function love.mousepressed(x,y,button)
  if button == 1 then
    if selected then
      selected.x,selected.y = x,y
      selected = nil
      for icountry,country in pairs(countries) do
        locdata[icountry] = {x=country.x,y=country.y}
        love.filesystem.write("location.json",json.encode(locdata))
      end
    else
      local dist = math.huge
      selected = nil
      for _,country in pairs(countries) do
        local cdist = math.sqrt( (x - country.x)^2 + (y - country.y)^2 )
        if cdist < dist then
          dist = cdist
          selected = country
        end
      end
    end
  elseif button == 2 then
    selected = nil
  end
end
