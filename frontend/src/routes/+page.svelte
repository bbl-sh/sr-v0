<script>
    import { goto } from "$app/navigation";
    import Card from "../components/ui/Card.svelte";
    import NewsCard from "../components/ui/NewsCard.svelte";
    import resultData from "./results/result.json";
    import admitcardData from "./admitcard/admit-card.json";
    import latestjobData from "./latest-job/latest-job.json";
</script>

<div class="container mx-auto px-4 py-4 flex justify-center">
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-x-6 gap-y-4">
        <Card
            title="Result"
            data={resultData.slice(0, 15)}
            viewMoreLink="/results"
        />
        <Card
            title="Admit Card"
            data={admitcardData.slice(0, 15)}
            viewMoreLink="/admitcard"
        />
        <Card
            title="Latest Job"
            data={latestjobData.slice(0, 15)}
            viewMoreLink="/latest-job"
        />
    </div>
    <!-- <div class="flex justify-end">
        <NewsCard />
    </div> -->
</div>
<div class="container mx-auto px-4 py-4 flex justify-center">
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-x-6 gap-y-4">
        <Card
            title="Result"
            data={resultData.slice(0, 15)}
            viewMoreLink="/results"
        />
        <Card
            title="Result"
            data={admitcardData.slice(0, 15)}
            viewMoreLink="/results"
        />
        <Card
            title="Result"
            data={resultData.slice(0, 15)}
            viewMoreLink="/results"
        />
    </div>
</div>
