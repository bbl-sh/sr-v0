<script>
    export let title;
    export let data;
    export let viewMoreLink;
</script>

<div class="card bg-base-300 shadow-xl max-w-[420px]">
    <div class="card-body items-center text-center">
        <h2 class="card-title">{title}</h2>
        <div class="grid grid-cols-1 gap-2">
            {#each data as item}
                <a href={item.url} class="btn btn-ghost">{item.title}</a>
            {/each}
        </div>
        <div class="card-actions justify-end">
            <a href={viewMoreLink} class="btn btn-primary">View more</a>
        </div>
    </div>
</div>
