<script>
    import { goto } from "$app/navigation";

    function navigateToPage() {
        goto("/");
    }
</script>

<div class="navbar bg-base-300">
    <div class="navbar-start">
        <a
            class="btn btn-ghost text-xl"
            href="/your-page"
            on:click|preventDefault={navigateToPage}>Adi-Raj</a
        >
    </div>
    <div class="navbar-center hidden lg:flex">
        <ul class="menu menu-horizontal px-1">
            <li><a href="./latest-job">Latest Job</a></li>
            <li><a href="./results">Result</a></li>
            <li><a href="./admitcard">Admit Card</a></li>
            <li><a href="./answerkey">Answer Key</a></li>
            <li><a href="./syllabus">Syllabus</a></li>
            <li><a href="./contactus">Contact Us</a></li>
        </ul>
    </div>
    <div class="navbar-end">
        <div class="join">
            <div>
                <div>
                    <input
                        class="input input-bordered join-item"
                        placeholder="Search"
                    />
                </div>
            </div>
            <select class="select select-bordered join-item">
                <option disabled selected>State-wise</option>
                <option>Sci-fi</option>
                <option>Drama</option>
                <option>Action</option>
            </select>
            <div class="indicator">
                <button class="btn join-item">Search</button>
            </div>
        </div>
        <div class="form-control">
            <label class="label cursor-pointer">
                <span class="label-text mr-5">Private</span>
                <input type="checkbox" class="toggle" />
            </label>
        </div>
    </div>
</div>
