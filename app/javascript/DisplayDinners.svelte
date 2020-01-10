<script>
import Dinners from './Dinners.svelte'
async function getDinners(){
  const res = await fetch('http://localhost:3000/api');
  const text = res.json();

  return text;
}
let dinners = getDinners();

</script>

{#await dinners}
  Loading Dinners!
{:then dinners}
 <Dinners {dinners} />
{/await}
