<script>
export let dinners;
let dinner_list = collectDinners(dinners);

function collectDinners(dinners) {
  debugger;
  let dinner_list = []
  for (let i = dinners; i < dinners.length; i++){

    dinner_list.push({name: dinners[i].name, love: dinners[i].love, notes: dinners[i].notes})
  }
}




</script>
<h1> DINNERS</h1>
{#each dinner_list as dinner}
  {dinner.name}
  {/each}
