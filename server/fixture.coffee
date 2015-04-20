Companies.find().fetch().forEach (i)->
  id = i._id
  Companies.remove id

if Companies.find().count() < 10
  num = _.random(50, 250)
  Companies.insert {
    name: 'ТСЖ №' + num + ' по Санкт-Петербургу и Ленобласти'
    alias: num + ''
    coords: [59.876428, 30.446602]
    houses: [
      {
        city: 'spb'
        street: 'ивановская'
        house: '28'
        corpus: null
        square: 5000
        flats: 232

      }
    ]
    mainInfo: {
      address: '196657, Санкт-Петербург, Колпино, Пролетарская ул., д. 60, корп. 3'
      phone: ['(812) 481-31-70', '(812) 300-31-70']
      head: 'Сурикова Екатерина Васильевна'
      hours: 'ежедневно, круглосуточно'
    }
  }

id = Companies.findOne()._id
Companies.update id, {$set: {'coords': [59.87288, 30.436833]}}