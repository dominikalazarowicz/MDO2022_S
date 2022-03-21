# Sprawozdanie Lab.02

### Hooks, heterogeniczne środowisko pracy, instancja Dockera

1. Przygotowanie git hook sprawdzającego, czy tytuł commita jest poprawnie nazwany, a więc składa się z moich inicjałów oraz numeru indeksu oraz sprawdzającego, czy w treści commita pada numer laboratorium, który jest właściwy dla zadania.
- modyfikacja pliku `commit-msg`
```
macbookpro@MacBookPros-MacBook-Pro MDO2022_S % git status
On branch MK401058
Your branch is up to date with 'origin/MK401058'.

nothing to commit, working tree clean
macbookpro@MacBookPros-MacBook-Pro MDO2022_S % ls -a
.			BB401928		JC401893
..			INO			Lab_instructions
.git			ITE			READMEs
macbookpro@MacBookPros-MacBook-Pro MDO2022_S % cd .git
macbookpro@MacBookPros-MacBook-Pro .git % cd hooks
macbookpro@MacBookPros-MacBook-Pro hooks % ls
applypatch-msg.sample		pre-push.sample
commit-msg.sample		pre-rebase.sample
post-update.sample		pre-receive.sample
pre-applypatch.sample		prepare-commit-msg.sample
pre-commit.sample		update.sample
macbookpro@MacBookPros-MacBook-Pro hooks % cp commit-msg.sample commit-msg
macbookpro@MacBookPros-MacBook-Pro hooks % nano commit-msg
```
- sprawdzenie działania
![bash](bash.png)
![bash](commit.png)

```
MK401058
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch MK401058
# Your branch is ahead of 'origin/MK401058' by 6 commits.
#   (use "git push" to publish your local commits)
#
# Changes to be committed:
#       new file:   test
#
CokolwiekLab02Cokolwiek
```
