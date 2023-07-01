---
name: New release repositories
about: Add release repositories to an existing release team.
title: 'Add new release repositories'
---

<!--
  Which release team will maintain these repositories?
  If you do not yet have a release team in the ros2-gbp-github-org project, please instead use the [new release team](https://github.com/ros2-gbp/ros2-gbp-github-org/issues/new?assignees=&labels=&projects=&template=new_release_team.md&title=Add+release+team) template instead.
  That template supports adding a new team and repositories at the same time.
-->
* Name of the release team: 

<!--
Before release repositories are created, repositories and packages should be submitted to the official rosdistro repository https://github.com/ros/rosdistro for naming review.
Guidelines for package naming are describe in REP-144: https://www.ros.org/reps/rep-0144.html

If you are requesting multiple repositories at once, please list them all here instead of creating multiple issues.
-->
* Release repositories to add:
  * REPOSITORY NAME
    <!--
      The ROS project maintains an index of official ROS distributions and the packages that they contain.
      Before a release repository is created, your repository must be listed in that index.
      You can request that a new repostiory be added by submitting a pull request to https://github.com/ros/rosdistro
      Once you have submitted the pull request, you may use it to complete and submit this issue.
      However, the release repository will not be created until the ros/rosdistro pull request has been merged.
    -->
    If there are any existing release repositories which should have their contents imported into the ros2-gbp organization, list and link to them here.
      Leave the checkbox _unchecked_. The ros2-gbp administrator will check the box when they have completed the repository import.
    * [ ] There is an existing release repository which should be imported: <RELEASE REPOSITORY URL>
