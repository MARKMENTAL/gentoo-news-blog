<template>
  <div class="card container mt-3">
    <h1 class="m-2">DistroWatch.com Distro Search</h1>
    <form class="m-3" @submit.prevent="searchDistro">
      <div class="m-3">
        <label for="distribution" class="form-label">Enter the distribution:</label>
        <input
          type="text"
          id="distribution"
          v-model="distribution"
          required
          class="form-control"
          placeholder="Enter the distribution..."
          @keyup.enter="searchDistro"
        />
      </div>
      <div class="mb-3">
        <button type="submit" class="btn btn-primary">Search DistroWatch</button>
      </div>
    </form>
    <div v-if="searchLink" class="mt-3">
      <p>
        Click
        <a :href="searchLink" target="_blank">here</a>
        to see information about the distribution "{{ distribution }}" on DistroWatch.org.
      </p>
    </div>
    <p class="mt-3">
      <strong>featured Distributions:</strong>
      <a :href="getDistroLink('gentoo')" target="_blank" class="btn btn-primary m-2">
        <img
          src="/gentoo-news-blog/gentoo-logo.png"
          alt="Gentoo"
          style="vertical-align: middle; margin: 5px; height: 20px"
        />
        Gentoo Linux
      </a>
      <!-- Add more popular distributions here -->
    </p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      distribution: "",
      searchLink: "",
    };
  },
  watch: {
    distribution: "generateSearchLink",
  },
  computed: {
    distroWatchLink() {
      return "https://distrowatch.com/";
    },
  },
  methods: {
    generateSearchLink() {
      if (this.distribution.trim() !== "") {
        const encodedDistribution = encodeURIComponent(this.distribution);
        this.searchLink = `${this.distroWatchLink}table.php?distribution=${encodedDistribution}`;
      } else {
        this.searchLink = "";
      }
    },
    getDistroLink(distroCode) {
      return `${this.distroWatchLink}table.php?distribution=${distroCode}`;
    },
    searchDistro() {
      if (this.searchLink !== "") {
        window.open(this.searchLink, "_blank");
      }
    },
  },
};
</script>

<style>
/* Add your custom CSS styles here */
</style>
