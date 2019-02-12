view: games {
  sql_table_name: test.games ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: added {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.added ;;
  }

  dimension: time_range {
    type: tier
    tiers: [0,6,12,18]
    style: integer
    sql: EXTRACT(hour from ${TABLE}.added) ;;
  }

  dimension: card_history {
    hidden: yes
    sql: ${TABLE}.card_history ;;
  }

  dimension: coin {
    type: yesno
    sql: ${TABLE}.coin ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: hero {
    type: string
    sql: ${TABLE}.hero ;;
  }

  dimension: hero_deck {
    type: string
    sql: ${TABLE}.hero_deck ;;
  }

  dimension: legend {
    type: number
    sql: ${TABLE}.legend ;;
  }

  dimension: mode {
    type: string
    sql: ${TABLE}.mode ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: opponent {
    type: string
    sql: ${TABLE}.opponent ;;
  }

  dimension: opponent_deck {
    type: string
    sql: ${TABLE}.opponent_deck ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: user_hash {
    type: string
    sql: ${TABLE}.user_hash ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: average_duration {
    type: average
    sql: ${TABLE}.duration/60 ;;
    drill_fields: [id, duration]
    value_format_name: decimal_1
  }
}

view: games__card_history {
  dimension: card {
    hidden: yes
    sql: ${TABLE}.card ;;
  }

  dimension: player {
    type: string
    sql: ${TABLE}.player ;;
  }

  dimension: turn {
    type: number
    sql: ${TABLE}.turn ;;
  }
}

view: games__card_history__card {
  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: mana {
    type: number
    sql: ${TABLE}.mana ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
