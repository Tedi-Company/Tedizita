-- 1. REGISTRAR O ITEM (A GEMA QUE CAI DO MINÉRIO)
minetest.register_craftitem("tedizita:gema", {
    description = "Gema de Tedizita Lendária",
    inventory_image = "tedizita_gema.png",
})

-- 2. REGISTRAR O BLOCO (O MINÉRIO NA PEDRA)
minetest.register_node("tedizita:minerio", {
    description = "Minério de Tedizita",
    tiles = {"tedizita_minerio.png"},
    groups = {cracky = 1}, -- Nível de dureza
    drop = "tedizita:gema", -- O que cai quando quebrado
    light_source = 7,       -- Faz o minério brilhar no escuro (fácil de achar)
})

-- 3. CONFIGURAR A GERAÇÃO NO MUNDO (RARO E PROFUNDO)
minetest.register_ore({
    ore_type       = "scatter",
    ore            = "tedizita:minerio",
    wherein        = "default:stone",
    clust_scarcity = 32 * 32 * 32, -- RARIDADE: Muito mais raro que diamante
    clust_num_ores = 3,            -- Quantidade por veio
    clust_size     = 2,
    y_min          = -31000,       -- Muito profundo
    y_max          = -1024,        -- Só aparece abaixo de 1km de profundidade
})

-- 4. A FERRAMENTA OP (PICARETA DE TEDIZITA)
minetest.register_tool("tedizita:picareta", {
    description = "Picareta de Tedizita (DESTRUIDORA)",
    inventory_image = "tedizita_tool_pick.png",
    tool_capabilities = {
        full_punch_interval = 0.1,
        max_drop_level = 3,
        groupcaps = {
            cracky = {times={0.1, 0.1, 0.1}, uses=5000, maxlevel=3}, -- Quebra tudo instantâneo
            choppy = {times={0.1, 0.1, 0.1}, uses=5000, maxlevel=3}, -- Também serve como machado
        },
        damage_groups = {fleshy=20}, -- Mata monstros com poucos golpes
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
