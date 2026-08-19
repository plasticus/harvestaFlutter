// Auto-generated seed data for mission_interruptors
const List<Map<String, dynamic>> missionInterruptorsSeedData = [
  {
    "type": "Salvage",
    "distance": 0.199,
    "cr": 1,
    "openingText": "Our short-range scanners have picked up some odd readings on a nearby asteroid -- possibly an old ship attached to it. Should we swing closer and get a better scan?",
    "textContent": "Yep, it's an old ship. No signs of life aboard. We'll take a few more minutes to let some scans run and see if we can get it added into our database.",
    "resultFail": "We just didn't bring the right kind of equipment to properly scan the ship into our salvage database. It's not working, and we can't waste anymore time on our way to the mission.",
    "resultPass": "Success. Salvage added to database."
  },
  {
    "type": "Pirate",
    "distance": 0.463,
    "cr": 1,
    "openingText": "Our short-range scanners have picked up some odd readings on a nearby asteroid -- possibly an old ship attached to it. Should we swing closer and get a better scan?",
    "textContent": "That's no abandoned old ship. Its C2 drives and weapon systems both just came online. Space pirates! Prepare for attack! (or flight!)",
    "resultFail": "We lost our squadron to a random group of space pirates.",
    "resultPass": "Those space pirates certainly regret attacking us."
  },
  {
    "type": "Rescue",
    "distance": 0.298,
    "cr": 1,
    "openingText": "Our short-range scanners have picked up some odd readings on a nearby asteroid -- possibly an old ship attached to it. Should we swing closer and get a better scan?",
    "textContent": "Upon further investigation, what we're seeing is a broken down ship, with minimal electrical readings -- but clear signs of life. Looks like we may have about 10 people still alive, and probably in need of rescue. Should we grab them, or flag this asteroid so someone else can help, or just ignore it?",
    "resultFail": "Something went wrong with our landing sequence, and we just can't safely rescue these people. We've flagged the coordinates -- hopefully someone else can get here in time to save these people.",
    "resultPass": "We successfully docked with the ship, and now have an extra 10 passengers aboard. They say they'll pay a reward for their safe return to any station, so we'll just bring them back to the station with us."
  },
  {
    "type": "Asteroid",
    "distance": 0.374,
    "cr": 1,
    "openingText": "Our short-range scanners have picked up some odd readings on a nearby asteroid -- possibly an old ship attached to it. Should we swing closer and get a better scan?",
    "textContent": "That's no ship -- that's just an asteroid with some very different readings than our ship expected in this zone. Should we try to add it to our asteroid database? ",
    "resultFail": "We just didn't bring the right kind of equipment to properly scan the asteroid into our database. It's not working, and we can't waste anymore time on our way to the mission.",
    "resultPass": "Success. Asteroid added to database."
  },
  {
    "type": "Salvage",
    "distance": 0.4,
    "cr": 1,
    "openingText": "We've encountered a distress signal just a few thousands clicks outside of our flight path. Should we investigate?",
    "textContent": "This distress signal must have been here a while. We found a derelict ship just drifting along, no signs of life, holes in the hull. Clearly victims of pirates. Should we try to add this to our salvage database to pick up later?",
    "resultFail": "We just didn't bring the right kind of equipment to properly scan the ship into our salvage database. It's not working, and we can't waste anymore time on our way to the mission.",
    "resultPass": "Success. Salvage added to database."
  },
  {
    "type": "Pirate",
    "distance": 0.472,
    "cr": 1,
    "openingText": "We've encountered a distress signal just a few thousands clicks outside of our flight path. Should we investigate?",
    "textContent": "We should have guessed -- it's a trap. Half the damn distress signals in the solar system are pirate traps. Their weapons are heating up -- prepare for battle!",
    "resultFail": "We lost our squadron to a random group of space pirates.",
    "resultPass": "Those space pirates certainly regret attacking us."
  },
  {
    "type": "Rescue",
    "distance": 0.463,
    "cr": 1,
    "openingText": "We've encountered a distress signal just a few thousands clicks outside of our flight path. Should we investigate?",
    "textContent": "After getting a closer look, we can see that we've got a Courier ship that's having some kind of problem with their MAM drives. C2 drives seem fine, but that won't get them anywhere before they run out of air and food. Their captain says they have 10 souls aboard. Should we pick them up, or flag this location for someone else to help?",
    "resultFail": "Something went wrong with our landing sequence, and we just can't safely rescue these people. We've flagged the coordinates -- hopefully someone else can get here in time to save these people.",
    "resultPass": "We successfully docked with the ship, and now have an extra 10 passengers aboard. They say they'll pay a reward for their safe return to any station, so we'll just bring them back to the station with us."
  },
  {
    "type": "Mechanical",
    "distance": 0.165,
    "cr": 1,
    "openingText": "We're getting some odd readings from our C2 drive sensors. It might be nothing, but should we take the time to check it out?",
    "textContent": "It appears to be a sensor going bad. Should we try to replace it en-route, or wait until we're back at the station? If we try en-route, we'll use a little more fuel as we'll have to slow down and then re-accelerate after the repair.",
    "resultFail": "We tried to replace it, but just made matters worse. Our ship was damaged a little bit.",
    "resultPass": "No problem. Sensor replaced, and we're not getting that error anymore."
  },
  {
    "type": "Mechanical",
    "distance": 0.1,
    "cr": 1,
    "openingText": "We're getting some odd readings from our C2 drive sensors. It might be nothing, but should we take the time to check it out?",
    "textContent": "Good thing we looked into the error message. We got some kind of space fungus growing back here. Should we try to clean it up now, or wait until we're back at the station? If we try en-route, we'll use a little more fuel as we'll have to slow down and then re-accelerate after the cleanup.",
    "resultFail": "Well, we tried to clean it up, but things got out of hand fast.",
    "resultPass": "We cleaned up the fungus quickly. It's a good thing we noticed it early, or it could have been a major problem."
  }
];
