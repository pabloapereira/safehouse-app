# safehouse-app

A vue project for Web Dev III class

---

You will develop a **_RESTful API_**
The API must fulfill the following use cases:

- **Database**
  survivors {
  name : string;
  age : Int32;
  gender: string;
  lastLocation: {
  latitude: decimal128;
  longitude: decimal128;
  }
  isAlive: boolean;
  }

- **Add survivors to the database**

  A survivor must have:
  _name_,
  _age_,
  _gender_
  _last location (latitude, longitude)_.
  Add basic validation for each field.

  Each survivor has their inventory of resources/items.
  The survivor must declare all of their resources in the sign-up process (no need to validate).

- **Update survivor location**

  Ability to update their last location.

- **Flag survivor as infected**

  Ability to flag the survivor as infected.

  An infected survivor cannot:
  *Trade with others,
  *Access/manipulate their inventory // Has to be enforced in the backend
  \*Be listed in the reports

  **A survivor is marked as infected when at least five other survivors report their contamination.**

- **Survivors cannot Add/Remove items from inventory**

  After the sign-up process, survivors can only change their inventory through trading with other survivors.
  Make sure that an error in the system doesn't end up with corrupted data! -> ?
  The items allowed in the inventory are described above in the first feature. -> ??

- **Trade items**:

  Survivors can trade items among themselves.

  To do that, they must respect the price table below, where the value of an item is described in terms of points.

  Both sides of the trade should offer the same amount of points. For example, 5 Fiji water and 5 first aid pouch (5 x 14 + 5 x 10) are worth 6 AK47 (6 x 8) plus 6 Cambell Soups (6 x 12)
  You will die without water for a day.
  You'll also die if you have a severe untreated wound.

  The API won't store the trades, but the items will be transferred from one survivor to the other.

| Item              | Points    |
| ----------------- | --------- |
| 1 Fiji Water      | 14 points |
| 1 Campbell Soup   | 12 points |
| 1 First Aid Pouch | 10 points |
| 1 AK47            | 8 points  |

Start the application with a reasonable amount of goods in stock, so it's easier to match prices and quantities for trading.

Another bonus point: You should try to make sure you won't have corrupted inventories. Make sure the trade is completed before taking the items away.

Make sure that the settlement have more weapons than the person buying it

- **Reports**

  The API must offer the following reports:

  1. Percentage of infected survivors.
  2. Percentage of non-infected survivors.
  3. The average amount of each kind of resource by the survivor (e.g. 10 Fiji Waters per survivor)
  4. Points lost because of an infected survivor.

---

## Notes

1. Use _Ruby (Rails)_
2. No authentication is needed;
3. Don't forget to make at least a minimal documentation of the API endpoints and how to use them;
4. Tests (unit, acceptance);
