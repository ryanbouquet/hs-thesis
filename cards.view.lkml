view: cards {
  sql_table_name: test.cards ;;

  dimension: card_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.cardId ;;
  }

  dimension: armor {
    type: number
    sql: ${TABLE}.armor ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
  }

  dimension: attack {
    type: number
    sql: ${TABLE}.attack ;;
  }

  dimension: test {
    type: number
    sql: 1 ;;
      html:
      {% if cards.attack._value == 2 %}
      4
      {% else %}
      3
      {% endif %} ;;
  }

  dimension: card_set {
    type: string
    sql: ${TABLE}.cardSet ;;
  }

  dimension: classes {
    type: string
    sql: ${TABLE}.classes ;;
  }

  dimension: collectible {
    type: yesno
    sql: ${TABLE}.collectible ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: dbf_id {
    type: number
    sql: ${TABLE}.dbfId ;;
  }

  dimension: durability {
    type: number
    sql: ${TABLE}.durability ;;
  }

  dimension: elite {
    type: yesno
    sql: ${TABLE}.elite ;;
  }

  dimension: faction {
    type: string
    sql: ${TABLE}.faction ;;
  }

  dimension: flavor {
    type: string
    sql: ${TABLE}.flavor ;;
  }

  dimension: health {
    type: number
    sql: ${TABLE}.health ;;
  }

  dimension: how_to_get {
    type: string
    sql: ${TABLE}.howToGet ;;
  }

  dimension: how_to_get_gold {
    type: string
    sql: ${TABLE}.howToGetGold ;;
  }

  dimension: img {
    type: string
    sql: ${TABLE}.img ;;
    html: <img src="{{value}}"/> ;;
  }

  dimension: img_gold {
    type: string
    sql: ${TABLE}.imgGold ;;
    html: <img src="{{value}}"/> ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: mechanics {
    hidden: yes
    sql: ${TABLE}.mechanics ;;
  }

  dimension: multi_class_group {
    type: string
    sql: ${TABLE}.multiClassGroup ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: player_class {
    type: string
    sql: ${TABLE}.playerClass ;;
    link: {
      label: "To Dashboard"
      url: "/dashboards/5?Class={{ value }}"
    }
  }

  dimension: link_back {
    type: string
    sql: "To Cards" ;;
    link: {
      label: "To Dashboard"
      url: "/dashboards/4?Card%20Name=Leeroy%20Jenkins&Min%20Games=>20"
    }
  }

  dimension: race {
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: rarity {
    type: string
    sql: ${TABLE}.rarity ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [card_id, name]
  }
}

view: cards__mechanics {
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
}
