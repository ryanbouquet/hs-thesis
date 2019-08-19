view: dt_test {
  derived_table: {
    sql: select * from ${cards.SQL_TABLE_NAME} ;;
    persist_for: "24 hours"
  }

  dimension: health {
    type: number
    sql: ${TABLE}.health ;;
  }

  dimension: card_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.cardId ;;
  }
}
