return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 24,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 2,
  nextobjectid = 1,
  backgroundcolor = { 0, 0, 0 },
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      filename = "tileset.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "tileset.png",
      imagewidth = 512,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 1024,
      tiles = {
        {
          id = 1,
          objectGroup = {
            type = "objectgroup",
            id = 4,
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 3,
                name = "",
                type = "",
                shape = "rectangle",
                x = 0,
                y = 0,
                width = 16,
                height = 16,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 2,
          objectGroup = {
            type = "objectgroup",
            id = 2,
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "rectangle",
                x = 0,
                y = 0,
                width = 16,
                height = 16,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 16,
      height = 24,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        327, 327, 327, 327, 327, 327, 327, 327, 327, 327, 327, 327, 327, 327, 327, 327,
        323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 321,
        323, 0, 642, 643, 0, 0, 0, 0, 0, 676, 0, 0, 0, 0, 0, 321,
        323, 0, 674, 675, 0, 0, 0, 0, 0, 0, 0, 0, 712, 713, 0, 321,
        323, 0, 0, 0, 0, 0, 0, 678, 0, 678, 0, 0, 744, 745, 0, 321,
        323, 0, 0, 0, 0, 105, 106, 106, 106, 106, 106, 106, 106, 106, 106, 106,
        323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 321,
        323, 0, 105, 107, 0, 0, 0, 0, 0, 0, 0, 0, 677, 0, 0, 321,
        323, 679, 0, 0, 679, 0, 0, 679, 0, 0, 0, 0, 0, 0, 0, 321,
        323, 711, 709, 710, 711, 709, 710, 711, 709, 710, 0, 0, 0, 0, 0, 321,
        106, 106, 106, 106, 106, 106, 106, 106, 106, 106, 107, 0, 0, 0, 0, 9,
        323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0,
        323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0,
        323, 0, 0, 520, 521, 522, 0, 0, 676, 0, 0, 0, 9, 0, 0, 0,
        323, 0, 0, 552, 513, 554, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0,
        323, 678, 0, 552, 545, 554, 0, 678, 0, 678, 9, 0, 0, 0, 0, 0,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
