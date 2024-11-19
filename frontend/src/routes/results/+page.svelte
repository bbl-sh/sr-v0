<script>
    import resultData from "./result.json";
</script>

<div class="container mx-auto px-4 py-4 flex justify-center">
    <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-1">
        <!-- Card 1 -->
        <div class="card bg-base-300 min-w-[800px] shadow-xl">
            <div class="card-body items-center text-center">
                <h2 class="card-title">Results</h2>
                {#each resultData as item}
                    <a href={item.url}>{item.title}</a>
                {/each}
            </div>
        </div>
    </div>
</div>
