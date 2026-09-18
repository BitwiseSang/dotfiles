return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",

  opts = {
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines.
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    legacy_computing_symbols_support = true,

    -- Smear cursor in insert mode.
    smear_insert_mode = true,

    -- Animation Physics
    stiffness = 0.5,
    trailing_stiffness = 0.2,
    trailing_exponent = 5,
    damping = 0.6,
    gradient_exponent = 1,
    gamma = 1,

    -- Cursor appearance
    never_draw_over_target = true,
    hide_target_hack = true,
    cursor_color = "#ff4000", -- RED

    -- Smear thresholds
    min_horizontal_distance_smear = 2,
    min_vertical_distance_smear = 1,

    -- Particles — tuned for tmux (lower values prevent frame drops)
    particles_enabled = true,
    particle_spread = 1,
    particles_per_second = 60,
    particles_per_length = 15,
    particle_max_lifetime = 200,
    particle_max_initial_velocity = 20,
    particle_velocity_from_cursor = 0.5,
    particle_damping = 0.15,
    particle_gravity = -50,
    min_distance_emit_particles = 0,
  },
}
