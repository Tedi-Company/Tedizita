-- 1. REGISTRAR O ITEM
minetest.register_craftitem("tedizita:gema", {
    description = "Gema de Tedizita Lendária",
    inventory_image = "tedizita_gema.png",
})

-- 2. REGISTRAR O BLOCO (Configurado para 10 segundos com diamante)
minetest.register_node("tedizita:minerio", {
    description = "Minério de Tedizita",
    tiles = {"tedizita_minerio.png"},
    groups = {cracky = 5}, -- 5 * 2.0 (tempo da picareta de diamante) = 10 segundos
    drop = "tedizita:gema",
    light_source = 7,
})

-- 3. CONFIGURAR A GERAÇÃO NO MUNDO
minetest.register_ore({
    ore_type       = "scatter",
    ore            = "tedizita:minerio",
    wherein        = "default:stone",
    clust_scarcity = 32 * 32 * 32,
    clust_num_ores = 3,
    clust_size     = 2,
    y_min          = -31000,
    y_max          = -1024,
})

-- 4. A FERRAMENTA OP (Picareta de Tedizita)
minetest.register_tool("tedizita:picareta", {
    description = "Picareta de Tedizita (DESTRUIDORA)",
    inventory_image = "tedizita_tool_pick.png",
    tool_capabilities = {
        full_punch_interval = 0.1,
        max_drop_level = 3,
        groupcaps = {
            cracky = {
                -- Quebra em 0.05s (5 * 0.01) mesmo com a dureza em 5
                times={[1]=0.01, [2]=0.01, [3]=0.01}, 
                uses=65535, 
                maxlevel=3
            },
            choppy = {
                times={[1]=0.1, [2]=0.1, [3]=0.1}, 
                uses=65535, 
                maxlevel=3
            },
        },
        damage_groups = {fleshy=20},
    },
})

-- 5. RECEITA DE CRAFTING
minetest.register_craft({
    output = "tedizita:picareta",
    recipe = {
        {"tedizita:gema", "tedizita:gema", "tedizita:gema"},
        {"", "default:stick", ""},
        {"", "default:stick", ""},
    }
})
