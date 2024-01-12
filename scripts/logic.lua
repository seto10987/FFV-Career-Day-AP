function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count == amount
    end
  end
function W2()
    return
    has ("Adamantite") or has ("world2")
end
function ExDeath()
    return
    has ("Bracelet") and has ("Anti_Barrier")
end
function W3()
    return
    has ("$ExDeath") or has ("world3")
end
function TABLETS1()
    return
    has ("1st_Tablet") or has ("2nd_Tablet") or has ("3rd_Tablet") or has ("4th_Tablet")
end
function TABLETS21()
    return
    has ("1st_Tablet") and has ("2nd_Tablet")
end
function TABLETS22()
    return
    has ("1st_Tablet") and has ("3rd_Tablet")
end
function TABLETS23()
    return
    has ("1st_Tablet") and has ("4th_Tablet")
end
function TABLETS24()
    return
    has ("2nd_Tablet") and has ("3rd_Tablet")
end
function TABLETS25()
    return
    has ("2nd_Tablet") and has ("4th_Tablet")
end
function TABLETS26()
    return
    has ("3rd_Tablet") and has ("4th_Tablet")
end
function TABLETS2()
    return
    has ("$TABLETS21") or has ("$TABLETS22") or has ("$TABLETS23") or has ("$TABLETS24") or has ("$TABLETS25") or has ("$TABLETS26")
end
function TABLETS31()
    return
    has ("1st_Tablet") and has ("2nd_Tablet") and has ("3rd_Tablet")
end
function TABLETS32()
    return
    has ("1st_Tablet") and has ("2nd_Tablet") and has ("4th_Tablet")
end
function TABLETS33()
    return
    has ("1st_Tablet") and has ("3rd_Tablet") and has ("4th_Tablet")
end
function TABLETS34()
    return
    has ("2nd_Tablet") and has ("3rd_Tablet") and has ("4th_Tablet")
end
function TABLETS3()
    return
    has ("$TABLETS31") or has ("$TABLETS32") or has ("$TABLETS33") or has ("$TABLETS34")
end